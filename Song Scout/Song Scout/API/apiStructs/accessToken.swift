//
//  accessToken.swift
//  Song Scout
//
//  Created by Nico Meiswinkel on 4/25/23.
//

import Foundation

struct accessTokenInfo: Hashable,Codable{
    var access_token: String
    var token_type: String
    var scope: String
    var expires_in: Int
    var refresh_token: String
}
