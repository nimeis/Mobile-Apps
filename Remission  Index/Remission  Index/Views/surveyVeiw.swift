//
//  surveyVeiw.swift
//  Remission  Index
//
//  Created by Nico Meiswinkel on 2/10/23.
//

import SwiftUI



struct surveyVeiw: View {
    @EnvironmentObject var modelData: ModelData
    @State private var score0:Float = 0.0
    @State var requestLogin = false
    @EnvironmentObject var dbHelper: surveyDatabaseHelper
    @EnvironmentObject var auth: fireStoreAuth
    var today = Date.now
    @State var canSubmit = true;
    
    
    
    var body: some View {
            NavigationView{
                List{
                    if(canSubmit)
                    {
                        ForEach(modelData.sections) { surveySection in
                            NavigationLink {
                                
                                sectionView(section: surveySection,score: $score0)
                                
                                
                                
                            } label: {
                                surveyRow(sectionIndex: surveySection.id)
                                    .scaledToFit()
                                
                                
                            }
                        }.listRowBackground(Color.blue)
                        
                        Button("Submit"){
                            let todaysSubmission = submission(id: UUID().uuidString, date: Date.now, section0: Int(modelData.sections[0].score), section1: Int(modelData.sections[1].score), section2: Int(modelData.sections[2].score), section3: Int(modelData.sections[3].score), section4: Int(modelData.sections[4].score), section5: Int(modelData.sections[5].score), section6: Int(modelData.sections[6].score), section7: Int(modelData.sections[7].score), section8: Int(modelData.sections[8].score), section9: Int(modelData.sections[9].score))

                                dbHelper.submitSurvey(submission: todaysSubmission)
                            Task{
                                do{
                                    try await checkDailySubmission()
                                } catch{
                                    print("unexpected error")
                                }
                            }
                            

                        }.listRowBackground(Color.black)
                    }
                    else{
                        Text("You already submitted your survey for today")
                    }
                }
            }
            .task {
                if(auth.user != nil)
                {
                    do{
                        try await checkDailySubmission()
                    } catch{
                        print("unexpected error")
                    }
                }
                

            }
        }
    func checkDailySubmission() async throws {
        do {
            var lastSubmissionDate =  try await dbHelper.getLastSubmissionDate()
            if let lastSubmission = lastSubmissionDate{
                let LastSubcomponents = Calendar.current.dateComponents([.year, .month, .day], from: lastSubmission)
                let todaysComponents = Calendar.current.dateComponents([.year, .month, .day], from: today)
                if let todayYear = todaysComponents.year,
                   let todayMonth = todaysComponents.month,
                   let todayDay = todaysComponents.day,
                   let lastSubYear = LastSubcomponents.year,
                   let lastSubMonth = LastSubcomponents.month,
                   let lastSubDay = LastSubcomponents.day{
                    if(todayDay == lastSubDay && todayMonth == lastSubMonth && todayYear == lastSubYear){
                        canSubmit = false
                    }else{
                        canSubmit = true
                    }
                }
            } else{
                canSubmit = true
            }
            
        } catch {
            print("UNEXPECTED ERROR")
        }
    }
    }


struct surveyVeiw_Previews: PreviewProvider {
    static var previews: some View {
        surveyVeiw()
            .environmentObject(ModelData())
    }
}
