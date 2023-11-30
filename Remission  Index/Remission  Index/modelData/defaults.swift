//
//  defaults.swift
//  Remission  Index
//
//  Created by Nico Meiswinkel on 2/10/23.
//

import Foundation

let d:defaults = defaults()

struct defaults{
    
    
    func initTodaysScores(){
        let defaults = UserDefaults.standard
        defaults.set(ModelData().sections[0].score, forKey: "0score")
        defaults.set(ModelData().sections[1].score, forKey: "1score")
        defaults.set(ModelData().sections[2].score, forKey: "2score")
        defaults.set(ModelData().sections[3].score, forKey: "3score")
        defaults.set(ModelData().sections[4].score, forKey: "4score")
        defaults.set(ModelData().sections[5].score, forKey: "5score")
        defaults.set(ModelData().sections[6].score, forKey: "6score")
        defaults.set(ModelData().sections[7].score, forKey: "7score")
        defaults.set(ModelData().sections[8].score, forKey: "8score")
        defaults.set(ModelData().sections[9].score, forKey: "9score")
        
    }
}
