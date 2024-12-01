//
//  AuthService.swift
//  iOS-CareerScrape
//
//  Created by Safal Gautam on 11/28/24.
//

import Foundation

class AuthService{
    static let shared = AuthService()
    private init(){}
    private let baseURL = "https://api.careerscrape.com/users"
    
    private let tokenKey = "jwtToken"
    private let currentUser = "currentUser"
    func login(username:String, password:String, completion: @escaping (Result<Void,Error>)->Void){
        guard let url = URL(string: "\(baseURL)/login") else {return}
        
        var request = URLRequest(url: url)
        request.httpMethod="POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String:String] = [ "username": username,
                                      "password": password
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body,options: [])
        URLSession.shared.dataTask(with: request){
            data, response, error in
            if let error = error{
                completion(.failure(error))
                return
            }
            
            guard let data = data,
                  let json  = try? JSONSerialization.jsonObject(with: data) as? [String:Any],
                  let token = json["token"] as? String else {
                completion(.failure(NSError(domain:"Invalid Response", code:0, userInfo: nil)))
                return
            }
            UserDefaults.standard.set(token, forKey: self.tokenKey)
            if let userDict = json["user"] as? [String:Any] {
                do {
                    let userData = try JSONSerialization.data(withJSONObject: userDict)
                    let user = try JSONDecoder().decode(AuthUser.self, from: userData)
                    print(user)
                    let encodedUser = try JSONEncoder().encode(user)
                    UserDefaults.standard.set(encodedUser, forKey: self.currentUser)
                }
                catch {
                    completion(.failure(error))
                }
            }
            completion(.success(()))
            
        }.resume()
        
    }
    
    func signup(username:String, email: String, password: String, isAdmin: Bool?, completion: @escaping(Result<Void, Error>)-> Void){
        guard let url = URL(string: "\(baseURL)/signup") else {return}
        
        var request=URLRequest(url: url)
        request.httpMethod="POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        var body: [String:Any] = [
            "username":username,
            "email":email,
            "password":password,
        ]
        if let isAdmin = isAdmin {
            body["isAdmin"] = isAdmin
        }
        
        request.httpBody=try? JSONSerialization.data(withJSONObject: body, options: [])
        
        URLSession.shared.dataTask(with: request){ data, response, error in
            
            if let error = error{
                completion(.failure(error))
                return
            }
            
            guard let data = data, let json = try? JSONSerialization.jsonObject(with: data) as?  [String:Any] else {
                completion(.failure(NSError(domain: "Invalid Response", code:0, userInfo: nil)))
                return
            }
            
            if let token = json["token"] as? String {
                UserDefaults.standard.set(token, forKey: self.tokenKey)
                
                if let userDict = json["user"] as? [String:Any] {
                    do {
                        let userData = try JSONSerialization.data(withJSONObject: userDict)
                        let user = try JSONDecoder().decode(AuthUser.self, from: userData)
                        
                        let encodedUser = try JSONEncoder().encode(user)
                        UserDefaults.standard.set(encodedUser, forKey: self.currentUser)
                    }
                    catch {
                        completion(.failure(error))
                    }
                }
                
            }
            // TODO: handle error response from the server
            
            completion(.success(()))
            
        }.resume()
        
    }
    func logout(completion: @escaping(Result<Void, Error>)-> Void){
        UserDefaults.standard.removeObject(forKey: self.tokenKey)
        completion(.success(()))
    }
}
