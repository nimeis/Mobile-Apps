//
//  dalleImageModel.swift
//  Pocket Painting
//
//  Created by Nico Meiswinkel on 3/13/23.
//

import Foundation

struct dalleImageModel: Hashable, Codable, Identifiable{
    var url: String
    let id = UUID()
}
