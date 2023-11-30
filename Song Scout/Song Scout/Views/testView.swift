//
//  testView.swift
//  Song Scout
//
//  Created by Nico Meiswinkel on 4/24/23.
//

import SwiftUI

struct testView: View {
    @EnvironmentObject var firestoreAuth: fireStoreAuth
    @EnvironmentObject var spotifyAPI: spotifyAPI
    @EnvironmentObject var firestoreDbHelper: databaseHelper
    
    @StateObject var queue: Queue = Queue()
    
    @State private var selectedGenresHistory: [[String]] = [] {
        didSet {
            print(selectedGenresHistory)
        }
    }
    @State private var filter = feedFilter()
    @State var presentSpotifyLogin = true
    @State var recommended: recommendationResponse?
    @State var song: Track?
    @State var songsLoaded = false
    @State var songsFailed = false
    @State private var isLoading = false
    @State var selectedGenres: [String] = []
    @State private var showSeedPicker = false
    @State private var seedsSelected = false
    
    var body: some View {
        ZStack {
            VStack {
                Spacer().frame(height: 50)
                if !songsFailed {
                    Group {
                        Text("Recent Seed Genres:")
                            .font(.title3)
                            .padding(.top)
                        ForEach(selectedGenresHistory.indices, id: \.self) { index in
                            HStack {
                                Text("Seeds \(index + 1):")
                                    .bold()
                                ForEach(selectedGenresHistory[index], id: \.self) { genre in
                                    Text(genre)
                                        .padding(.horizontal, 4)
                                }
                            }
                            .padding(.bottom, 4)
                        }
                    }
                    .padding(.horizontal)
                    Spacer().frame(height: 100)
                    Button(action: {
                        showSeedPicker.toggle()
                    }) {
                        Text("Choose Seeds")
                            .font(.system(size: 18, weight: .semibold))
                            .padding(.vertical, 12)
                            .padding(.horizontal, 24)
                            .foregroundColor(Color.black)
                            .background(Color.green)
                            .cornerRadius(8)
                    }
                }
                Spacer().frame(height: 30)
                if seedsSelected && !songsFailed{
                    Button("Load Recommendations") {
                        isLoading = true
                        Task{
                            do{
                                recommended = try await spotifyAPI.getRecommendations( limit:10, seedGenres: selectedGenres)
                                try await spotifyAPI.addTracksToQueue(tracks:recommended!.tracks)
                                queue.q.append(contentsOf: recommended!.tracks)
                                songsLoaded = true
                            }catch{
                                print("Error: Could not load any songs based on the given seed")
                                songsFailed = true
                            }
                            isLoading = false
                        }
                    }
                    .font(.system(size: 16, weight: .semibold))
                    .padding(.vertical, 12)
                    .padding(.horizontal, 24)
                    .foregroundColor(Color.black)
                    .background(Color.green)
                    .cornerRadius(8)
                    if songsLoaded && queue.length != 0 {
                        SongPlayerView(song: queue.q[0])
                    }
                    Spacer().frame(height: 35)
                    Button("Skip Forward"){
                        Task{
                            try await spotifyAPI.skipNext()
                        }
                        queue.q.remove(at: 0)
                    }
                    .font(.system(size: 16, weight: .semibold))
                    .padding(.vertical, 12)
                    .padding(.horizontal, 24)
                    .foregroundColor(Color.black)
                    .background(Color.green)
                    .cornerRadius(8)
                }
                if songsFailed && queue.length == 0 {
                    VStack {
                        Spacer()
                        Text("We could not load any of your recommendations because we received an error from Spotify. They need to get their act together! Please restart the app and try again :)")
                            .multilineTextAlignment(.center)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(8)
                            .foregroundColor(.white)
                            .shadow(radius: 10)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.5))
                }
                if showSeedPicker {
                    seedPicker(selectedGenres: $selectedGenres, seedsSelected: $seedsSelected, showSeedPicker: $showSeedPicker)
                        .transition(.move(edge: .bottom))
                }
                if isLoading {
                    LoadingScreen().zIndex(1)
                }
            }
            .sheet(isPresented: $presentSpotifyLogin){
                spotifyAuthenticationViewController(onSignedIn: loadPreviousSeeds)
                    .ignoresSafeArea()
            }
            .onDisappear(perform: loadPreviousSeeds)
        }
        .preferredColorScheme(.dark)
    }
    
    private func loadPreviousSeeds() {
        databaseHelper.shared.retrieveSeeds(currentUser: firestoreAuth.user) { result in
            switch result {
            case .success(let seedHistory):
                selectedGenresHistory = seedHistory
            case .failure(let error):
                print("Error loading previous seeds: \(error.localizedDescription)")
            }
        }
    }
}

struct LoadingScreen: View {
    @State private var isLoading = false
    var body: some View {
        ZStack {
            Color.black
            Circle()
                .trim(from: 0, to: 0.8)
                .stroke(Color.green, lineWidth: 5)
                .frame(width: 80, height: 80)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false))
                .onAppear() {
                    isLoading = true
                }
        }
        .edgesIgnoringSafeArea(.all)
    }
}
