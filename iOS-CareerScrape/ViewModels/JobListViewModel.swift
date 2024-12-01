//
//  JobViewModel.swift
//  iOS-CareerScrape
//
//  Created by Safal Gautam on 11/28/24.
//
import Foundation

class JobListViewModel: ObservableObject{
    @Published var jobs: [Job] = []
    @Published var isLoading: Bool = false
    @Published var error: Error?
    private let jobService = JobService.shared
    
    func fetchJobs(){
        self.isLoading = true
        jobService.fetchJobs{ [weak self] result in
                DispatchQueue.main.async{
                self?.isLoading = false
                switch result{
                case .success(let jobs):
                    self?.jobs = jobs
                    
                case .failure(let error):
                    self?.error = error
                }
            }
        }
    }
}
