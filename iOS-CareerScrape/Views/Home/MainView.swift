//
//  MainView.swift
//  iOS-CareerScrape
//
//  Created by Safal Gautam on 12/12/24.
//

import SwiftUI

struct MainView: View {
    @State private var quotes: [QuoteSchema] = []
    @State private var isLoading: Bool = true
    @State private var savedJobs: [Job] = []
    var body: some View {
        NavigationView {
            VStack {
                if isLoading {
                    ProgressView("Fetching Quotes...")
                        .padding()
                } else if quotes.isEmpty {
                    Text("No quotes available.")
                        .font(.headline)
                        .foregroundColor(.gray)
                } else {
                    List {
                        
                        
                        Section(header: Text("Quote for today")) {
                            ForEach(quotes, id: \.q) { quote in
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("\"\(quote.q)\"")
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                    
                                    Text("- \(quote.a)")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                .padding(.vertical, 8)
                            }
                        }
                        Section(header: Text("Saved Jobs")) {
                            if savedJobs.isEmpty {
                                Text("No saved jobs.")
                                    .foregroundColor(.gray)
                            } else {
                                ForEach(savedJobs, id: \.id) { job in
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
                                        
                                    }
                                }
                            }
                        }
                    }
                    .listStyle(InsetGroupedListStyle())
                }
            }
            .navigationTitle("CareerScrape")
            .onAppear {
                fetchQuotes { fetchedQuotes in
                    if let fetchedQuotes = fetchedQuotes {
                        quotes = fetchedQuotes
                    }
                    isLoading = false
                }
                savedJobs = JobManager.shared.getSavedJobs()
            }
        }
    }
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
