//
//  userSubmissionView.swift
//  Remission  Index
//
//  Created by Nico Meiswinkel on 4/13/23.
//

import SwiftUI

struct userSubmissionView: View {
    
    var submission:userSubmission
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        VStack{
            HStack{
                
                Text("Submitted by: \(submission.userName ?? "Anonymous")")
            }
            ForEach(modelData.sections){section in
                VStack{
                    Text(section.title)
                        .bold()
                    Spacer()
                    Text("Score: \(submission.submission.get(sectionScoreIndex: section.id))")
                    Spacer()
                }
            }
        }
    }
}

struct userSubmissionView_Previews: PreviewProvider {
    static var previews: some View {
        userSubmissionView(submission: userSubmission(id: UUID().uuidString, userName: "Nico Meis", submission: submission(id: UUID().uuidString, date: Date.now, section0: 1, section1: 2, section2: 2, section3: 3, section4: 2, section5: 3, section6: 2, section7: 4, section8: 5, section9: 6)))
            .environmentObject(ModelData())
    }
}
