//
//  apiConstants.swift
//  Song Scout
//
//  Created by Nico Meiswinkel on 4/25/23.
//

import Foundation

enum apiConstants{
    
    static let CLIENT_ID = "736f7bdac55f4e1e8d280cb6a9237c3e"
    static let CLIENT_SECRET = "9f170c225fee47d8b0f42a43b1aedad3"
    static let authorizationString = "\(CLIENT_ID):\(CLIENT_SECRET)"

    static let apiHost = "api.spotify.com"
    static let authHost = "accounts.spotify.com"
    static let redirectURI = "https://www.google.com"
    static let responseType = "code"
    static let scopes = "user-read-private, user-modify-playback-state,user-top-read"
    static let contentType = "application/x-www-form-urlencoded"
    static let showDialouge = "true"
    
    static var authParams = [
        "response_type": responseType,
        "client_id": CLIENT_ID,
        "redirect_uri": redirectURI,
        "scope": scopes,
        "show_dialog": showDialouge
    ]
    
    static var tokenRequestHeaders = [
        "Authorization": "Basic \(Data(authorizationString.utf8).base64EncodedString())",
        "Content_Type": contentType
    ]
}

