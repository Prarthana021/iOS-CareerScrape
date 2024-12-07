//
//  JobDetailView.swift
//  iOS-CareerScrape
//
//  Created by Safal Gautam on 12/6/24.
//

import SwiftUI


struct JobDetailView:View {
    let job:Job
    
    var body: some View {
        let formattedExactDate = formatDate(job.exactDate)
        let formatPulledDate = formatDate(job.pulledDate)
        
        VStack{
            ScrollView(.vertical){
                VStack(alignment: .leading, spacing:16){
                    Text(job.jobTitle).font(.largeTitle).fontWeight(.bold)
                    
                    HStack{
                        Text(job.companyName)
                            .font(.headline).foregroundStyle(.secondary)
                        // add link using job.companyLink
                        Spacer()
                        HStack{
                            Image(systemName: "mappin").foregroundStyle(.red)
                            Text(job.jobLocation).font(.subheadline).foregroundStyle(.gray)
                        }
                    }
                    HStack{
                        Text("Job Type:").fontWeight(.bold)
                        Text(job.jobType).foregroundStyle(.primary)
                        Spacer()
                        Text("Level:").fontWeight(.bold)
                        Text(job.jobLevel).foregroundStyle(.primary)
                    }
                    HStack{
                        Text("Posted:").fontWeight(.bold)
                        Text("\(job.jobPosted)\n(\(String(describing: formattedExactDate ?? "N/A")))").font(.footnote).foregroundStyle(.green)
                        Text("Pulled:").fontWeight(.bold)
                        Text(String(describing: formatPulledDate ?? "N/A")).font(.footnote).foregroundStyle(.green)
                        
                    }
                    Text("Job Description").font(.title2).fontWeight(.bold)
                    Text(job.description)
                    
                }
                
            }
            Spacer()
            Link(destination: URL(string: job.jobLink)!) {
                Text("Apply Now")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
        }.padding()
        
        
    }
}
//struct JobDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        JobDetailView(job: Job(
//            id: "123e4567-e89b-12d3-a456-426614174000",
//            jobTitle: "Software Engineer",
//            jobLink: "https://example.com/jobs/software-engineer",
//            jobLocation: "New York, NY",
//            companyName: "Tech Solutions Inc.",
//            jobType: "Full-time",
//            companyDomain: "techsolutions.com",
//            jobLevel: "Entry Level",
//            companyLink: "https://techsolutions.com",
//            description: "We are looking for a passionate software engineer to join our team. The ideal candidate should have experience in Golang and React.We are looking for a passionate software engineer to join our team. The ideal candidate should have experience in Golang and React.We are looking for a passionate software engineer to join our team. The ideal candidate should have experience in Golang and React.We are looking for a passionate software engineer to join our team. The ideal candidate should have experience in Golang and React.We are looking for a passionate software engineer to join our team. The ideal candidate should have experience in Golang and React.We are looking for a passionate software engineer to join our team. The ideal candidate should have experience in Golang and React.We are looking for a passionate software engineer to join our team. The ideal candidate should have experience in Golang and React.We are looking for a passionate software engineer to join our team. The ideal candidate should have experience in Golang and React.We are looking for a passionate software engineer to join our team. The ideal candidate should have experience in Golang and React.We are looking for a passionate software engineer to join our team. The ideal candidate should have experience in Golang and React.We are looking for a passionate software engineer to join our team. The ideal candidate should have experience in Golang and React.",
//            pulledDate: "2024-10-20T14:30:00Z",
//            exactDate: "2024-10-17T09:00:00Z",
//            jobPosted: "3 days ago"
//        ))
//        
//    }
//}
