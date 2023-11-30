//
//  songTheory.swift
//  Standalone
//
//  Created by Nico Meiswinkel on 1/30/23.
//

import SwiftUI

struct songTheory: View {
    
    @EnvironmentObject var modelData: ModelData
    var song: Song
    
    var songIndex: Int {
            modelData.songs.firstIndex(where: { $0.id == song.id })!
        }
    
    
    var body: some View {
        VStack{
            HStack {
                Text("Tempo: \(song.tempo,specifier: "%.2f")")
                Image(systemName:"digitalcrown.horizontal.arrow.counterclockwise")
            }
            HStack {
                Text("Time Signature: \(song.time_signature)")
                Image(systemName:"music.note")
            }
            
        }
        .foregroundColor(.white)
    }
}

struct songTheory_Previews: PreviewProvider {
    static var previews: some View {
        var songs = ModelData().songs
        songTheory(song: songs[0])
    }
}
