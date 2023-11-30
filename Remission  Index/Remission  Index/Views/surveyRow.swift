//
//  surveyRow.swift
//  Remission  Index
//
//  Created by Nico Meiswinkel on 4/12/23.
//

import SwiftUI

struct surveyRow: View {
    var sectionIndex:Int
    @State var sectionScores:[previousScoreSnapshot] = []
    var section:surveySection { ModelData().sections[sectionIndex]
    }
    @EnvironmentObject var auth: fireStoreAuth
    @EnvironmentObject var modelData: ModelData
    @EnvironmentObject var dbHelper: surveyDatabaseHelper
    
    var body: some View {
        VStack{
                Text(section.title)
                    .font(.title)
            Text("Today's Score: " + String(format: "%1.0f",modelData.sections[sectionIndex].score))
                .font(.title3)
        }
        .multilineTextAlignment(.center)
        //.frame(height: 130)
        .background(.blue)
        .task {
            if(auth.user != nil)
            {
                do{
                    sectionScores = try await dbHelper.getPreviousSectionData(sectionIndex: sectionIndex)
                }catch{
                print("unexpected error")
                }
            }
            
            
        }
    }
}

struct surveyRow_Previews: PreviewProvider {
    static var previews: some View {
        let sections = ModelData()
        surveyRow(sectionIndex: 0)
            .environmentObject(ModelData())
            .environmentObject(sections)
        
    }
}
