//
//  UserService.swift
//  iOS-CareerScrape
//
//  Created by Safal Gautam on 11/28/24.
//

import Foundation


class UserService{
    static let shared = UserService()
    private init() {}
    private let tokenKey = "jwtToken"
    private let currentUser = "currentUser"
    
    
    func fetchCurrentUser(completion: @escaping (Result<User, Error>)-> Void){
        guard let user = self.fetchCurrentAuthUser() else{
            return
        }
        let username: String = user.username
        print(username)
        let baseURL = "https://api.careerscrape.com/users/username/\(username)"
        print(baseURL)
        guard let url = URL(string: baseURL) else{
            completion(.failure(NSError(domain: "Invalid URL", code:0, userInfo: nil)))
            return
        }
        print(url)
        let token = UserDefaults.standard.string(forKey: tokenKey) ?? ""
        print(token)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        print("Request URL: \(url)")
        print("HTTP Method: \(request.httpMethod ?? "GET")")
        print("Headers: \(request.allHTTPHeaderFields ?? [:])")
        
        URLSession.shared.dataTask(with: request){
            data, response, error in
            if let error = error{
                completion(.failure(error))
                return
            }
            
            guard let data = data else{
                print("no data")
                completion(.failure(NSError(domain: "No data", code:0, userInfo: nil)))
                return
            }
            do {
                struct UserResponse: Decodable {
                    let user: User
                }
                if let responseString = String(data: data, encoding: .utf8) {
                    print("Raw server response: \(responseString)")
                }
                
                
                let decodedResponse = try JSONDecoder().decode(UserResponse.self, from: data)
                completion(.success(decodedResponse.user))
            } catch {
                print("Decoding failed with error: \(error)")
                completion(.failure(error))
            }
            
        }.resume()
    }
    
    func fetchCurrentAuthUser() -> AuthUser? {
        guard let userData = UserDefaults.standard.data(forKey: currentUser) else {
            return nil
        }
        
        do {
            let user = try JSONDecoder().decode(AuthUser.self, from: userData)
            return user
        }
        catch {
            print("Failed to decode the user \(error)")
            return nil
        }
    }
    
    func fetchAllUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        let baseURL = "https://api.careerscrape.com/users/"
        let token = UserDefaults.standard.string(forKey: tokenKey) ?? ""
        print(token)
        
        guard let url = URL(string: baseURL) else{
            completion(.failure(NSError(domain: "Invalid URL", code:0, userInfo: nil)))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        print("Request URL: \(url)")
        print("HTTP Method: \(request.httpMethod ?? "GET")")
        print("Headers: \(request.allHTTPHeaderFields ?? [:])")
        
        let task = URLSession.shared.dataTask(with: request){
            data, response, error in
            if let error = error{
                completion(.failure(error))
                return
            }
            
            guard let data = data else{
                print("no data")
                completion(.failure(NSError(domain: "No data", code:0, userInfo: nil)))
                return
            }
            do {
                struct UserResponse: Decodable {
                    let users: [User]
                }
                if let responseString = String(data: data, encoding: .utf8) {
                    print("Raw server response: \(responseString)")
                }
                
                let decodedResponse = try JSONDecoder().decode(UserResponse.self, from: data)
                completion(.success(decodedResponse.users))
            } catch {
                print("Decoding failed with error: \(error)")
                completion(.failure(error))
            }
            
        }
        task.resume()
    }
}
