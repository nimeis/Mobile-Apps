//
//  completionResponse.swift
//  Pocket Painting
//
//  Created by Nico Meiswinkel on 3/13/23.
//

import Foundation

struct completionResponse: Hashable, Codable{
    var choices:[completionChoices]
    
    struct completionChoices: Hashable, Codable{
        var text:String
    }
}
