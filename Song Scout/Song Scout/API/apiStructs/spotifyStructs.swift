//
//  spotifyStructs.swift
//  Song Scout
//
//  Created by Nico Meiswinkel on 4/26/23.
//

import Foundation

struct Followers: Hashable, Codable {
    var total: Int?
}

struct Image: Hashable, Codable {
    var url: String
    var height: Int
    var width: Int
}

struct Artist: Hashable, Codable, Identifiable {
    var followers: Followers?
    var genres: [String]?
    var id: String
    var images: [Image]?
    var name: String
    var popularity: Int?
}

struct Album: Hashable, Codable, Identifiable {
    var total_tracks: Int
    var id: String
    var images: [Image]
    var name: String
    var genres: [String]?
    var popularity: Int?
}

class Queue: ObservableObject {
    @Published var q: [Track] = []
    var length: Int {
        return q.count
    }
}

struct SearchResults: Hashable, Codable {
    var recommendedTracks: [Track]
}

struct Track: Hashable, Codable, Identifiable {
    var album: Album?
    var artists: [Artist]?
    var duration_ms: Int?
    var id: String
    var popularity: Int?
    var name: String
    var preview_url: String?
    var uri: String
}

struct AudioAnalysis: Codable {
    let bars: [AudioSegment]
    let beats: [AudioSegment]
    let sections: [AudioSection]
    let segments: [AudioSegment]
    let tatums: [AudioSegment]
    
    struct AudioSegment: Codable {
        let start: Double
        let duration: Double
        let confidence: Double
    }
    
    struct AudioSection: Codable {
        let start: Double
        let duration: Double
        let confidence: Double
        let loudness: Double
        let key: Int
        let mode: Int
    }
}

struct Seed: Codable, Hashable {
    var afterFilteringSize: Int
    var id: String
}

struct recommendationResponse: Codable, Hashable {
    var seeds: [Seed]
    var tracks: [Track]
}

struct topTracks: Codable, Hashable {
    var tracks: [Track]
}

struct topArtists: Codable, Hashable {
    var artists: [Artist]
}

struct spotifyUser: Codable, Hashable, Identifiable {
    var email: String
    var display_name: String
    var id: String
}
