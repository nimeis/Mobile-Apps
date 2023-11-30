//
//  submissionBlogView.swift
//  Remission  Index
//
//  Created by Nico Meiswinkel on 4/13/23.
//

import SwiftUI

struct submissionBlogView: View {
    
    @State var submissions:[userSubmission] = []
    @State var searchDate:Date = Date.now
    @State var selectingDate:Bool = false
    @State var loading:Bool = false
    @EnvironmentObject var dbHelper:surveyDatabaseHelper
    @EnvironmentObject var auth:fireStoreAuth
    
    var body: some View {
        
        VStack{
            Text(searchDate.formatted(date: .long, time:.omitted))
            Button("Pick a date"){
                selectingDate = true
            }
            if(loading)
            {
                ProgressView()
            } else{
                    List{
                        ForEach(submissions) { submission in
                            userSubmissionView(submission: submission)
                        }
                    }
                    
                
            }
            
            
        }
        .task {
            if(!(auth.user == nil))
            {
                do{
                    loading = true
                    submissions = try await dbHelper.getDaysSubmissions(date: searchDate)
                    loading = false
                }catch{
                    print("unexpected error")
                }
            }
            
        }
        .popover(isPresented: $selectingDate){
            VStack{
                DatePicker("Choose a day", selection: $searchDate,displayedComponents:.date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                Button("Select date"){
                    selectingDate = false
                    loading = true
                    Task{
                        do{
                            submissions = try await dbHelper.getDaysSubmissions(date: searchDate)
                            loading = false
                        }catch{
                            print("unexpected error")
                        }
                    }
                }
            }
            
            
            
            
        }
    }
}

struct submissionBlogView_Previews: PreviewProvider {
    static var previews: some View {
        submissionBlogView()
    }
}
