//
//  spotifyError.swift
//  Song Scout
//
//  Created by Nico Meiswinkel on 4/26/23.
//

import Foundation

struct spotifyError: Hashable, Codable{
    struct error{
        var status: Int
        var message: String
    }
}


