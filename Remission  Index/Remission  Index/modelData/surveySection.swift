//
//  surveySection.swift
//  Remission  Index
//
//  Created by Nico Meiswinkel on 2/10/23.
//

import Foundation
import SwiftUI
import CoreLocation

struct surveySection: Hashable, Codable, Identifiable {
    var id:Int
    var title:String
    var contents:[String]
    var score:Float
    var score0:Int
    var score1:Int
    var score2:Int
    var score3:Int
    var score4:Int
    
    }

