//
//  previosScoreSnapshot.swift
//  Remission  Index
//
//  Created by Nico Meiswinkel on 4/12/23.
//

import Foundation

struct previousScoreSnapshot: Hashable, Codable, Identifiable {
    var id: String
    var date:Date
    var sectionScore:Int
    
}
