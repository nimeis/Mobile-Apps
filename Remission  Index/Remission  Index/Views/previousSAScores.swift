//
//  previousSAScores.swift
//  Remission  Index
//
//  Created by Nico Meiswinkel on 2/10/23.
//

import SwiftUI

struct previousSAScores: View {
    @AppStorage("skilledAdvocate0") var score0 = 0
    @AppStorage("skilledAdvocate1") var score1 = 0
    @AppStorage("skilledAdvocate2") var score2 = 0
    @AppStorage("skilledAdvocate3") var score3 = 0
    @AppStorage("skilledAdvocate4") var score4 = 0
    var yesterday = Date().addingTimeInterval(TimeInterval(-86400))
   var body: some View {
        
       HStack{
           ZStack {
               Rectangle()
                   .foregroundColor(.blue)
               VStack{
                   Text(yesterday.addingTimeInterval(TimeInterval(-(86400*4))), format: .dateTime.day().month())
                   Text("\(score4)")
               }
           }
           ZStack {
               Rectangle()
                   .foregroundColor(.blue)
               VStack{
                   Text(yesterday.addingTimeInterval(TimeInterval(-(86400*3))), format: .dateTime.day().month())
                   Text("\(score3)")
               }
           }
           ZStack {
               Rectangle()
                   .foregroundColor(.blue)
               VStack{
                   Text(yesterday.addingTimeInterval(TimeInterval(-(86400*2))), format: .dateTime.day().month())
                   Text("\(score2)")
               }
           }
           ZStack {
               Rectangle()
                   .foregroundColor(.blue)
               VStack{
                   Text(yesterday.addingTimeInterval(TimeInterval(-86400)), format: .dateTime.day().month())
                   Text("\(score1)")
               }
               
           }
           ZStack {
               Rectangle()
                   .foregroundColor(.blue)
               VStack {
                   Text(yesterday, format: .dateTime.day().month())
                   Text("\(score0)")
               }
           }
           
           
           
           
       }
       .background(.black)
    }
}

struct previousSAScores_Previews: PreviewProvider {
    static var previews: some View {
        previousSAScores()
    }
}
