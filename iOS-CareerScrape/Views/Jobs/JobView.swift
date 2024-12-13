//
//  JobView.swift
//  iOS-CareerScrape
//
//  Created by Safal Gautam on 12/1/24.
//

import SwiftUI


struct JobView: View{
    @StateObject private var viewModel = JobListViewModel()
    @State private var showSavedJobs = false
    @State private var searchText = ""
    
    var filterJobs: [Job]{
        if searchText.isEmpty{
            return viewModel.jobs
        }
        else{
            return viewModel.jobs.filter{
                job in
                job.jobTitle.lowercased().contains(searchText.lowercased()) ||
                job.jobLocation.lowercased().contains(searchText.lowercased()) ||
                job.jobLevel.lowercased().contains(searchText.lowercased()) || job.jobType.lowercased().contains(searchText.lowercased()) ||
                job.companyName.lowercased().contains(searchText.lowercased()) ||
                job.companyDomain.lowercased().contains(searchText.lowercased())
            }
        }
    }
    var body: some View{
        if viewModel.isLoading{
            ProgressView("Loading...")
        }
        else if let  error=viewModel.error{
            Text("Error: \(error.localizedDescription)").foregroundColor(.red)
        }
        else{
            NavigationView{
                VStack{
                    SearchBar(text: $searchText, placeholder: "Search by title, location, or company").padding()
                    List(filterJobs, id: \.id){ job in
                        NavigationLink(destination: JobDetailView(job: job)){
                            
                            
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
                }
                
            }
            
            .onAppear {
                if viewModel.jobs.isEmpty && !viewModel.isLoading{
                    viewModel.fetchJobs()
                }
            }
            
        }
    }
    
}

struct JobView_Previews: PreviewProvider {
    static var previews: some View {
        JobView()
    }
}
