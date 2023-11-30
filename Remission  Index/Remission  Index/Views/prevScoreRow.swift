//
//  surveyRow.swift
//  Remission  Index
//
//  Created by Nico Meiswinkel on 2/10/23.
//

import SwiftUI

struct prevScoreRow: View {
    var sectionIndex:Int
    @State var sectionScores:[previousScoreSnapshot] = []
    var section:surveySection { ModelData().sections[sectionIndex]
    }
    @EnvironmentObject var modelData: ModelData
    @EnvironmentObject var dbHelper: surveyDatabaseHelper
    @EnvironmentObject var auth: fireStoreAuth
    
    var body: some View {
        VStack{
                Text(section.title)
                    .font(.title)
                
            previousScores(sectionScores: sectionScores)
            
        }
        .frame(height: 130)
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

struct prevScoreRow_Previews: PreviewProvider {
    static var previews: some View {
        let sections = ModelData().sections
        prevScoreRow(sectionIndex: 0)
            .environmentObject(ModelData())
            .environmentObject(surveyDatabaseHelper())
        
    }
}
