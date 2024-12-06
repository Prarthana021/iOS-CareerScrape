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
            NavigationView{
                List(viewModel.jobs, id: \.id){ job in
                    VStack(alignment: .leading){
                        HStack{
                            
                            Text(job.jobTitle).font(.headline).fontWeight(.bold)
                            Spacer()
                            HStack{
                                Image(systemName:"mappin").foregroundColor(.red)
                                Text(job.jobLocation).font(.subheadline).foregroundColor(.gray)
                            }
                            
                        }
                        
                        HStack{
                            Text(job.companyName).font(.subheadline)
                                .foregroundColor(.secondary)
                            Spacer()
                            
                            Text(job.jobPosted).foregroundColor(.green)
                            
                        }
                        
                    }
                    
                }.navigationTitle("Job Listings")
            }
            .onAppear {
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
