//
//  previousScoresView.swift
//  Remission  Index
//
//  Created by Nico Meiswinkel on 4/12/23.
//

import SwiftUI

struct previousScoresView: View {
    
    @EnvironmentObject var modelData: ModelData
    @EnvironmentObject var dbHelper: surveyDatabaseHelper
    var today = Date.now
    
    
    
    var body: some View {
        List{
            ForEach(modelData.sections){ surveySection in
                prevScoreRow(sectionIndex: surveySection.id)
                
            }.listRowBackground(Color.black)
        }.listStyle(.plain)
    }
}

struct previousScoresView_Previews: PreviewProvider {
    static var previews: some View {
        previousScoresView()
    }
}
