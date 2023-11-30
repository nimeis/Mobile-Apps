//
//  seedPicker.swift
//  Song Scout
//
//  Created by Nico Meiswinkel on 4/28/23.


import SwiftUI

import FirebaseAuth

struct seedPicker: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var spotifyAPI : spotifyAPI
    @EnvironmentObject var firestoreAuth: fireStoreAuth
    let availableGenres = ["acoustic","afrobeat", "alt-rock", "alternative", "ambient", "anime", "black-metal", "bluegrass", "blues", "bossanova", "brazil", "breakbeat", "british", "cantopop", "chicago-house", "children", "chill", "classical", "club", "comedy", "country", "dance", "dancehall", "death-metal", "deep-house", "detroit-techno", "disco", "disney", "drum-and-bass", "dub", "dubstep", "edm", "electro", "electronic", "emo", "folk", "forro", "french", "funk", "garage", "german", "gospel", "goth", "grindcore", "groove", "grunge", "guitar", "happy", "hard-rock", "hardcore", "hardstyle", "heavy-metal", "hip-hop", "holidays", "honky-tonk", "house", "idm", "indian", "indie", "indie-pop", "industrial", "iranian", "j-dance", "j-idol", "j-pop", "j-rock", "jazz", "k-pop", "kids", "latin", "latino", "malay", "mandopop", "metal", "metal-misc", "metalcore", "minimal-techno", "movies", "mpb", "new-age", "new-release", "opera", "pagode", "party", "philippines-opm", "piano", "pop", "pop-film", "post-dubstep", "power-pop", "progressive-house", "psych-rock", "punk", "punk-rock", "r-n-b", "rainy-day", "reggae", "reggaeton", "road-trip", "rock", "rock-n-roll", "rockabilly", "romance", "sad", "salsa", "samba", "sertanejo", "show-tunes", "singer-songwriter", "ska", "sleep", "songwriter", "soul", "soundtracks", "spanish", "study", "summer", "swedish", "synth-pop", "tango", "techno", "trance", "trip-hop", "turkish", "work-out", "world-music"]
    @Binding var selectedGenres: [String]
    @Binding var seedsSelected: Bool
    @Binding var showSeedPicker: Bool

    var body: some View {
        NavigationView {
            VStack{
                Spacer().frame(height: 40)
                Text("Genres (Choose up to 5)")
                    .font(.title)
                ScrollView {
                    LazyVGrid(columns: Array(repeating: .init(.flexible(minimum: 100, maximum: .infinity), spacing: 10), count: 2), spacing: 10) {
                        ForEach(availableGenres, id: \.self) { genre in
                            Button(action: {
                                if selectedGenres.count < 5 && !selectedGenres.contains(genre) {
                                    selectedGenres.append(genre)
                                }
                            }) {
                                Text(genre)
                                    .padding()
                                    .foregroundColor(.black)
                                    .background(Color.green)
                                    .cornerRadius(8)
                            }
                        }
                    }
                    .padding()
                }
                Button("Proceed") {
                    dismiss()
                    seedsSelected = true
                    showSeedPicker = false
                }
                .font(.system(size: 16, weight: .semibold))
                .padding()
                .background(Color.green)
                .foregroundColor(.black)
                .cornerRadius(8)
            }
            .preferredColorScheme(.dark)
        }
    }
}
