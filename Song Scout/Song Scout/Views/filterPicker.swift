//
//  filterPicker.swift
//  Song Scout
//
//  Created by Nico Meiswinkel on 4/28/23.
//

import SwiftUI

struct filterPicker: View {
    @State var filter = feedFilter()
    var body: some View {
        Form {
            Section(header: Text("Acousticness")) {
                Slider(value: $filter.min_acousticness, in: 0...1)
                Slider(value: $filter.max_acousticness, in: 0...1)
            }
            Section(header: Text("Danceability")) {
                Slider(value: $filter.min_danceability, in: 0...1)
                Slider(value: $filter.max_danceability, in: 0...1)
            }
            Section(header: Text("Energy")) {
                Slider(value: $filter.min_energy, in: 0...1)
                Slider(value: $filter.max_energy, in: 0...1)
            }
            Section(header: Text("Instrumentalness")) {
                Slider(value: $filter.min_instrumentalness, in: 0...1)
                Slider(value: $filter.max_instrumentalness, in: 0...1)
            }
            Section(header: Text("Liveness")) {
                Slider(value: $filter.min_liveness, in: 0...1)
                Slider(value: $filter.max_liveness, in: 0...1)
            }
            Section(header: Text("Popularity")) {
                Slider(value: $filter.min_popularity, in: 0...1)
                Slider(value: $filter.max_popularity, in: 0...1)
            }
            Section(header: Text("Speechiness")) {
                Slider(value: $filter.min_speechiness, in: 0...1)
                Slider(value: $filter.max_speechiness, in: 0...1)
            }
            Section(header: Text("Tempo")) {
                Slider(value: $filter.min_tempo, in: 0...1000)
                Slider(value: $filter.max_tempo, in: 0...1000)
            }
            Section(header: Text("Valence")) {
                Slider(value: $filter.min_valence, in: 0...1)
                Slider(value: $filter.max_valence, in: 0...1)
            }
        }
        //Have user create a feedFilter Object (defaults can be changed but consult spotifyAPI)
    }
}

struct feedFilter: Hashable, Codable {
    var min_acousticness: Float = 0
    var max_acousticness: Float = 1
    var min_danceability: Float = 0
    var max_danceability: Float = 1
    var min_energy: Float = 0
    var max_energy: Float = 1
    var min_instrumentalness: Float = 0
    var max_instrumentalness: Float = 1
    var min_liveness: Float = 0
    var max_liveness: Float = 1
    var min_popularity: Float = 0
    var max_popularity: Float = 1
    var min_speechiness: Float = 0
    var max_speechiness: Float = 1
    var min_tempo: Double = 0
    var max_tempo: Double = 1000
    var min_valence: Float = 0
    var max_valence: Float = 1
}

struct filterPicker_Previews: PreviewProvider {
    static var previews: some View {
        filterPicker()
    }
}
