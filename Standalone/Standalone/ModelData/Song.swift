//
//  Song.swift
//  Standalone
//
//  Created by Nico Meiswinkel on 1/30/23.
//

import Foundation
import SwiftUI
import CoreLocation

struct Song: Hashable, Codable, Identifiable {
    
    var id: Int
    var acousticness: Float
    var adustedAcusticness: Float {
        return acousticness * 275
    }
    var danceability: Float
    var adustedDanceability: Float {
        return danceability * 275
    }
    var duration_ms: Float
    var energy: Float
    var adustedEnergy: Float {
        return energy * 275
    }
    var instrumentalness: Float
    var adustedInstrumentalness: Float {
        return instrumentalness * 275
    }
    var key: Int
    var liveness: Float
    var adustedLiveness: Float {
        return liveness * 275
    }
    var loudness: Float
    var adustedLoudness: Float {
        return abs(loudness * 20)
    }
    var mode: Int
    var speechiness: Float
    var adustedSpeechiness: Float {
        return speechiness * 350
    }
    var tempo: Float
    var time_signature:Int
    var valence: Float
    var adustedValence: Float {
        return valence * 275
    }
    var liked: Bool
    var song_title: String
    var artist: String
    
    func getLoudness() -> Float { return abs(loudness * 20) }
}

