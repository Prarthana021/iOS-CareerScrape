//
//  JobView.swift
//  iOS-CareerScrape
//
//  Created by Safal Gautam on 12/1/24.
//

import SwiftUI


struct JobView: View{
    @StateObject private var viewModel = JobListViewModel()
    var body: some View{
        if viewModel.isLoading{
            ProgressView("Loading...")
        }
        else if let  error=viewModel.error{
            Text("Error: \(error.localizedDescription)").foregroundColor(.red)
        }
        else{
            List(viewModel.jobs, id: \.id){ job in
                VStack(alignment: .leading){
                    Text(job.jobTitle).font(.headline)
                    Text(job.companyName).font(.subheadline)
                }
            
            }.onAppear {
                viewModel.fetchJobs()
                
            }
        }
    }
}
struct JobView_Previews: PreviewProvider {
    static var previews: some View {
        JobView()
    }
}
