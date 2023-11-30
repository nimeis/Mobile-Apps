//
//  prevScore.swift
//  Remission  Index
//
//  Created by Nico Meiswinkel on 4/12/23.
//

import SwiftUI

struct prevScore: View {
    var date:Date
    var score:Int
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.blue)
            VStack{
                Text(date, format: .dateTime.day().month())
                Text("\(score)")
            }
        }
    }
}

struct prevScore_Previews: PreviewProvider {
    static var previews: some View {
        prevScore(date: Date.now, score: 5)
    }
}
