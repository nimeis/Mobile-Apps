//
//  previousScores.swift
//  Remission  Index
//
//  Created by Nico Meiswinkel on 2/10/23.
//

import SwiftUI

struct previousScores: View {
    //@EnvironmentObject var dbHelper:surveyDatabaseHelper
    var sectionScores:[previousScoreSnapshot]
    var noScores:Bool{
        sectionScores.isEmpty
    }
    var previosScoreSnapshots:[previousScoreSnapshot]{
        
        if noScores{
            return sectionScores
        }else{
            let latestScoreComp = Calendar.current.dateComponents([.day], from: sectionScores[0].date)
            let todayComp = Calendar.current.dateComponents([.day], from: Date.now)
        
                var scores = sectionScores
            if(latestScoreComp.day! == todayComp.day!)
                {
                    scores.remove(at: 0)
                    return scores
                }
                else{
                    scores.remove(at: scores.count-1)
                    return scores
                }

        }
    }
        
    let yesterday = Date.now.addingTimeInterval(TimeInterval(-86400))
    var body: some View {
        HStack{
            if noScores{
                Text("No previous Scores")
            }else{
                ForEach(previosScoreSnapshots) { previousScoreSnapshot in
                    if let snapshot = previousScoreSnapshot{
                        prevScore(date: snapshot.date, score: snapshot.sectionScore)
                    }
                    
                }
            }
            
   
        }
        .background(.black)
    }
}

struct previousScores_Previews: PreviewProvider {
    static var previews: some View {
        let sections = ModelData().sections
        //previousScores()
    }
}
