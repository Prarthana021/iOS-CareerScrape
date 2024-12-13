//
//  JobDetailView.swift
//  iOS-CareerScrape
//
//  Created by Safal Gautam on 12/6/24.
//

import SwiftUI


struct JobDetailView:View {
    let job:Job
    @State private var isSaved: Bool = false
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
//            Link(destination: URL(string: job.jobLink)!) {
//                Text("Save Job")
//                    .font(.headline)
//                    .padding()
//                    .frame(maxWidth: .infinity)
//                    .background(Color.black)
//                    .foregroundColor(.white)
//                    .cornerRadius(8)
//            }
            Button(action: toggleSaveJob){
                Text(isSaved ? "Unsave Job" : "Save Job")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
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
            .onAppear{
                isSaved = JobManager.shared.isJobSaved(job)
            }
        
        
    }
    private func toggleSaveJob(){
        if isSaved{
            JobManager.shared.unsaveJob(job)
        }
        else{
            JobManager.shared.saveJob(job)
        }
        isSaved.toggle()
    }
//    private func checkIfJobSaved() {
//        let savedJobs = UserDefaults.standard.savedJobs
//        isSaved = savedJobs.contains(where: { $0.id = job.id })
//    }
}

class JobManager{
    static let shared = JobManager()
    private let savedJobsKey = "savedJobs"
    
    private init(){
        
    }
    func saveJob(_ job: Job){
        var savedJobs = getSavedJobs()
        if !savedJobs.contains(where: {$0.id == job.id}){
            savedJobs.append(job)
            saveJobsToStorage(savedJobs)
        }
    }
    func unsaveJob(_ job: Job){
        var savedJobs = getSavedJobs()
        savedJobs.removeAll(where: {$0.id == job.id})
        saveJobsToStorage(savedJobs)
        
    }
    func isJobSaved(_ job: Job) -> Bool{
        let savedJobs = getSavedJobs()
        return savedJobs.contains(where: {$0.id == job.id})
    }
    func getSavedJobs() -> [Job]{
        guard let data = UserDefaults.standard.data(forKey: savedJobsKey),
              let jobs = try? JSONDecoder().decode([Job].self, from: data) else {
            return []
        }
        return jobs
    }
    
    func saveJobsToStorage(_ jobs: [Job]){
        do{
            let encodeData = try JSONEncoder().encode(jobs)
            UserDefaults.standard.set(encodeData, forKey: savedJobsKey)
        }
        catch{
            print("Failed to save jobs: \(error.localizedDescription)")
        }
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
