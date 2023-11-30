//
//  SongPlayerView.swift
//  Song Scout
//
//  Created by madsk on 4/26/23.
//

import SwiftUI
import AVFoundation
import CoreMedia

struct SongPlayerView: View {
    // Properties to track the current playback state
    @State var isPlaying = true
    @State var progress: Double = 0
    @EnvironmentObject var spotifyAPI : spotifyAPI
    // Audio player instance
    var url:URL{ URL(string: song.preview_url!)!}
    var audioPlayer:AVAudioPlayer {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            return try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
        } catch let error {
            print(error.localizedDescription)
            return AVAudioPlayer()
        }
    }
    @State private var searchTerm = ""
    // Song metadata
    let song: Track
    // Audio analysis data
    @State var  audioAnalysis: AudioAnalysis?

    var body: some View {
        VStack {
            // Album art
            if let imageURL = song.album?.images[0].url {
                if let data = try? Data(contentsOf: URL(string: imageURL)!),
                   let image = UIImage(data: data) {
                    SwiftUI.Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } else {
                    SwiftUI.Image(systemName: "music.note")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            // Song name and first artist name
            if let artist = song.artists?[0].name{
                Text("\(song.name) - \(artist)")
                    .font(.headline)
                    .padding(.top, 16)
            } else  {
                Text("\(song.name) - \("Unkown")")
                    .font(.headline)
                    .padding(.top, 16)
            }
            Spacer()
            // Waveform view
            if let analysis = audioAnalysis{
                WaveformView(audioAnalysis: analysis, progress: $progress)
            }
            
        }
        .onAppear {
            // Add an observer to update the playback progress
            do{
                Task{
                    audioAnalysis = try await spotifyAPI.getTrackAnalysis(trackId: song.id)!
                    let player = audioPlayer
                    player.play()
                    while player.isPlaying {
                        progress = player.currentTime / player.duration
                        usleep(1000)
                    }
                }
            }
        }
        .onDisappear {
            // Stop the audio player when the view disappears
            self.audioPlayer.pause()
        }
    }
}


