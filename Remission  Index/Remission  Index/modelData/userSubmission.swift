//
//  userSubmission.swift
//  Remission  Index
//
//  Created by Nico Meiswinkel on 4/13/23.
//

import Foundation

struct userSubmission: Hashable, Codable, Identifiable {
    var id: String
    var userName: String?
    var submission: submission
}
