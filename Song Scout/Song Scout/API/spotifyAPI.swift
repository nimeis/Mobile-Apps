//
//  spotifyAPI.swift
//  Song Scout
//
//  Created by Nico Meiswinkel on 4/25/23.
//

import Foundation
import SwiftUI

class spotifyAPI: ObservableObject{
    static let shared = spotifyAPI()
    var accessToken: accessTokenInfo?
    @Published var selectedGenresHistory: [[String]] = []
    
    enum spotifyAPIError: Error {
        case accessTokenNotDecoded
        case refreshTokenNotDecoded
        case errorNotDecoded
        case analyisNotDecoded
        case recommendedTracksNotDecoded
        case topTracksNotDecoded
    }
    

    //takes artists then tracks then genres can be supplied more
    func getRecommendations(limit: Int, seedGenres: [String]) async throws -> recommendationResponse?{
        var count = 0
        var genreString = ""
        for genre in seedGenres{
            if count < 5 {
                if (genreString == ""){
                    genreString.append(genre)
                }
                else{
                    genreString.append(",\(genre)")
                }
                count = count + 1
            }
        }
        var components = URLComponents()
        components.scheme = "https"
        components.host = apiConstants.apiHost
        components.path = "/v1/recommendations"
        components.queryItems = [
            URLQueryItem(name: "seed_genres", value: genreString),
            URLQueryItem(name: "limit", value: String(limit))
        ]
        guard let url = components.url else {return nil}
        print(url)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = [
            "Authorization" : "Bearer \(accessToken!.access_token)",
            "Content-Type" : "application/json",
            "Accept": "application/json"
        ]
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        print(String(bytes: data, encoding: String.Encoding.utf8) ?? "NIL")
            if let decodedTracks = try? JSONDecoder().decode(recommendationResponse.self, from: data) {
                print(decodedTracks)
                return decodedTracks
            } else {
                throw spotifyAPIError.recommendedTracksNotDecoded
            }
    }
    
    func getTrackAnalysis(trackId:String) async throws -> AudioAnalysis?{
        var components = URLComponents()
        components.scheme = "https"
        components.host = apiConstants.apiHost
        components.path = "/v1/audio-analysis/\(trackId)"
        guard let url = components.url else {return nil}
        print(url)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = [
            "Authorization" : "Bearer \(accessToken!.access_token)",
        ]
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        print(String(bytes: data, encoding: String.Encoding.utf8) ?? "NIL")
        if let decodedAnalyis = try? JSONDecoder().decode(AudioAnalysis.self, from: data) {
                print(decodedAnalyis)
                return decodedAnalyis
            } else {
                throw spotifyAPIError.analyisNotDecoded
            }
    }
    
    func addTracksToQueue(tracks: [Track]) async throws {
        var components = URLComponents()
        components.scheme = "https"
        components.host = apiConstants.apiHost
        components.path = "/v1/me/player/queue"
        print(tracks.count)
        for track in tracks {
            sleep(UInt32(0.25))
            components.queryItems = [URLQueryItem(name: "uri", value: track.uri)]
            guard let url = components.url else {return}
            print(url)
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            urlRequest.allHTTPHeaderFields = [
                "Authorization" : "Bearer \(accessToken!.access_token)",
            ]
            try await URLSession.shared.data(for: urlRequest)
        }
    }
    
    func skipNext() async throws{
        var components = URLComponents()
        components.scheme = "https"
        components.host = apiConstants.apiHost
        components.path = "/v1/me/player/next"
        guard let url = components.url else {return}
        print(url)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.allHTTPHeaderFields = [
            "Authorization" : "Bearer \(accessToken!.access_token)",
        ]
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        print(String(bytes: data, encoding: String.Encoding.utf8) ?? "NIL")
            if let decodedError = try? JSONDecoder().decode(spotifyError.self, from: data) {
                print(decodedError)
            } else {
                throw spotifyAPIError.errorNotDecoded
            }
    }
    
    // Unused func
    func skipPrevious() async throws{
        var components = URLComponents()
        components.scheme = "https"
        components.host = apiConstants.apiHost
        components.path = "/v1/me/player/previous"
        guard let url = components.url else {return}
        print(url)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.allHTTPHeaderFields = [
            "Authorization" : "Bearer \(accessToken!.access_token)",
        ]
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        print(String(bytes: data, encoding: String.Encoding.utf8) ?? "NIL")
            if let decodedError = try? JSONDecoder().decode(spotifyError.self, from: data) {
                print(decodedError)
            } else {
                throw spotifyAPIError.errorNotDecoded
            }
    }
    
    // Unused func
    func startPlayBack() async throws{
        var components = URLComponents()
        components.scheme = "https"
        components.host = apiConstants.apiHost
        components.path = "/v1/me/player/play"
        guard let url = components.url else {return}
        print(url)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = [
            "Authorization" : "Bearer \(accessToken!.access_token)",
        ]
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        print(String(bytes: data, encoding: String.Encoding.utf8) ?? "NIL")
            if let decodedError = try? JSONDecoder().decode(spotifyError.self, from: data) {
                print(decodedError)
            } else {
                throw spotifyAPIError.errorNotDecoded
            }
    }
    
    // used func
    func getUserInfo() async throws -> spotifyUser?{
        var components = URLComponents()
        components.scheme = "https"
        components.host = apiConstants.apiHost
        components.path = "/v1/me"
        guard let url = components.url else {return nil}
        print(url)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = [
            "Authorization" : "Bearer \(accessToken!.access_token)",
        ]
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        print(String(bytes: data, encoding: String.Encoding.utf8) ?? "NIL")
            if let decodedUser = try? JSONDecoder().decode(spotifyUser.self, from: data) {
                print(decodedUser)
                return decodedUser
            } else {
                throw spotifyAPIError.errorNotDecoded
            }
    }
    
    // Unused func
    func pausePlayBack() async throws{
        var components = URLComponents()
        components.scheme = "https"
        components.host = apiConstants.apiHost
        components.path = "/v1/me/player/pause"
        guard let url = components.url else {return}
        print(url)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "PUT"
        urlRequest.allHTTPHeaderFields = [
            "Authorization" : "Bearer \(accessToken!.access_token)",
        ]
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        print(String(bytes: data, encoding: String.Encoding.utf8) ?? "NIL")
            if let decodedError = try? JSONDecoder().decode(spotifyError.self, from: data) {
                print(decodedError)
            } else {
                throw spotifyAPIError.errorNotDecoded
            }
    }
    
    func getAuthCodeURL() -> URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = apiConstants.authHost
        components.path = "/authorize"
        components.queryItems = apiConstants.authParams.map{URLQueryItem(name: $0, value: $1)}
        guard let url = components.url else {return nil}
        return URLRequest(url: url)
    }
    
    @objc func refreshToken() async throws{
        var components = URLComponents()
        components.scheme = "https"
        components.host = apiConstants.authHost
        components.path = "/api/token"
        guard let url = components.url else {return}
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.allHTTPHeaderFields = apiConstants.tokenRequestHeaders
        var requestBodyComponents = URLComponents()
        requestBodyComponents.queryItems = [
            URLQueryItem(name: "grant_type", value: "refresh_token"),
            URLQueryItem(name: "refresh_token", value: accessToken?.refresh_token),
        ]
        urlRequest.httpBody = requestBodyComponents.query?.data(using: .utf8)
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        print(String(bytes: data, encoding: String.Encoding.utf8) ?? "NIL")
            if let decodedToken = try? JSONDecoder().decode(accessTokenInfo.self, from: data) {
                print(decodedToken)
                accessToken = decodedToken
            } else {
                throw spotifyAPIError.refreshTokenNotDecoded
            }
    }
    
    func getAccessToken(accessCode: String) async throws -> accessTokenInfo?{
        var components = URLComponents()
        components.scheme = "https"
        components.host = apiConstants.authHost
        components.path = "/api/token"
        guard let url = components.url else {return nil}
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.allHTTPHeaderFields = apiConstants.tokenRequestHeaders
        var requestBodyComponents = URLComponents()
        requestBodyComponents.queryItems = [
            URLQueryItem(name: "grant_type", value: "authorization_code"),
            URLQueryItem(name: "code", value: accessCode),
            URLQueryItem(name: "redirect_uri", value: apiConstants.redirectURI)
        ]
        urlRequest.httpBody = requestBodyComponents.query?.data(using: .utf8)
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        print(String(bytes: data, encoding: String.Encoding.utf8) ?? "NIL")
            if let decodedToken = try? JSONDecoder().decode(accessTokenInfo.self, from: data) {
                print(decodedToken)
                return decodedToken
            } else {
                throw spotifyAPIError.accessTokenNotDecoded
            }
    }
    
    // Unused func
    func search(query: String, type: String, limit: Int = 20) async throws -> SearchResults? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = apiConstants.apiHost
        components.path = "/v1/search"
        components.queryItems = [
            URLQueryItem(name: "q", value: query),
            URLQueryItem(name: "type", value: type),
            URLQueryItem(name: "limit", value: String(limit))
        ]
        guard let url = components.url else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = [
            "Authorization": "Bearer \(accessToken!.access_token)",
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        let (data, _) = try await URLSession.shared.data(for: urlRequest)

        if let decodedResults = try? JSONDecoder().decode(SearchResults.self, from: data) {
            return decodedResults
        } else {
            throw spotifyAPIError.recommendedTracksNotDecoded
        }
    }
}

    

