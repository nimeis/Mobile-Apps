//
//  songDetail.swift
//  Standalone
//
//  Created by Nico Meiswinkel on 1/30/23.
//

import SwiftUI

struct songDetail: View {
    @EnvironmentObject var modelData: ModelData
    var song: Song
    
    var songIndex: Int {
            modelData.songs.firstIndex(where: { $0.id == song.id })!
        }
    
    var body: some View {
        VStack{
            Text(song.song_title)
            Text(song.artist)
            Text("Info")
            TabView{
                Text("TODO")
                    .tabItem{
                        Label("Theory", systemImage: "music.note")
                        Text("Theory")
                    }
                Text("Song")
                    .tabItem{
                        Label("Song", systemImage: "lines.measurement.horizontal")
                        Text("Song")
                    }
                songCarachteristics(song: song)
                    .tabItem{
                        Label("Characteristics", systemImage: "music.note.list")
                        Text("Characteristics")
                    }
            }
            
        }
        
    }
}

struct songDetail_Previews: PreviewProvider {
    static var previews: some View {
        var songs = ModelData().songs
        songDetail(song: songs[0])
    }
}
