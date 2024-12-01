//
//  JobService.swift
//  iOS-CareerScrape
//
//  Created by Safal Gautam on 11/28/24.
//

import Foundation

class JobService{
    static let shared=JobService()
    private init (){}
    
    private let baseURL = "https://api.careerscrape.com/jobs"
    
    func fetchJobs(completion: @escaping (Result<[Job], Error>) -> Void){
        let url = URL(string: "\(baseURL)/jobs")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error=error{
                completion(.failure(error))
                return
            }
            guard let data = data else{
                completion(.failure(NSError(domain:"No data", code: 0, userInfo: nil)))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                struct JobResponse: Decodable {
                    let jobs: [Job]
                }
                
                let jobResponse = try decoder.decode(JobResponse.self,from: data)
                completion(.success(jobResponse.jobs))
            }
            catch{
                completion(.failure(error))
            }
        }
        task.resume()
    }
    func fetchJobWithId(){
        
    }
    func deleteJobs(){
        
    }
    func createJob(){
        
    }
    func updateJob(){
        
    }
    
    
}
