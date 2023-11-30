//
//  songRow.swift
//  Standalone
//
//  Created by Nico Meiswinkel on 1/30/23.
//

import SwiftUI

struct songRow: View {
    
    var song : Song
    
    var body: some View {
        
    
            HStack{
                VStack {
                    HStack {
                        Image(song.artist)
                        Text(song.song_title)
                    Spacer()
                    
                    Text("\(song.duration_ms/1000/60,specifier: "%.2f")m")
                    }
                    HStack {
                        Text(song.artist)
                            .font(.title3)
                            .multilineTextAlignment(.center)
                        if(song.liked)
                        {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.mint)
                        }
                        else
                        {
                            Image(systemName: "heart")
                        }
                    }
                    .foregroundColor(.black)
                }
                
                    
            }
            .foregroundColor(.purple)
//            capsule(color: .purple, width: 500)
//                .offset(x:110, y:40)
        .background(
            LinearGradient(gradient: Gradient(colors: [.black,.black,.black,.purple, .purple  ]), startPoint: .top, endPoint: .bottom)
        )
        .clipShape(RoundedRectangle(cornerRadius: 15))
        
        
        
        
        
        
        
    }
}

struct songRow_Previews: PreviewProvider {
    static var previews: some View {
         var songs = ModelData().songs
        
        songRow(song: songs[0])
    }
}
