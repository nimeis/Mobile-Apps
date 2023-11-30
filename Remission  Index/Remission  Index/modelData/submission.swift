//
//  submission.swift
//  Remission  Index
//
//  Created by Nico Meiswinkel on 4/11/23.
//
import Foundation

struct submission: Hashable, Codable, Identifiable {
    var id: String
    var date:Date
    var section0: Int
    var section1: Int
    var section2: Int
    var section3: Int
    var section4: Int
    var section5: Int
    var section6: Int
    var section7: Int
    var section8: Int
    var section9: Int
    
    func get(sectionScoreIndex: Int) -> Int{
        if (sectionScoreIndex == 0)
        {
            return section0
        }
        else if (sectionScoreIndex == 1)
        {
            return section1
        }
        else if (sectionScoreIndex == 2)
        {
            return section2
        }
        else if (sectionScoreIndex == 3)
        {
            return section3
        }
        else if (sectionScoreIndex == 4)
        {
            return section4
        }
        else if (sectionScoreIndex == 5)
        {
            return section5
        }
        else if (sectionScoreIndex == 6)
        {
            return section6
        }
        else if (sectionScoreIndex == 7)
        {
            return section7
        }
        else if (sectionScoreIndex == 8)
        {
            return section8
        }
        else if (sectionScoreIndex == 9)
        {
            return section9
        }
        else{
            return -1
        }
    }

}
