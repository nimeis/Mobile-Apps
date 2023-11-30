//
//  songDetail2.swift
//  Standalone
//
//  Created by Nico Meiswinkel on 1/30/23.
//

import SwiftUI

struct songDetail2: View {
    @EnvironmentObject var modelData: ModelData
    var song: Song
    
    var songIndex: Int {
            modelData.songs.firstIndex(where: { $0.id == song.id })!
        }
    
   //state
    @State private var showTheory = true
    @State private var showCharachteristics = true
    
    
    var body: some View {
        
        ScrollView
        {
            
            Image(song.artist)
                .clipShape(Circle())
            
            
            
                .edgesIgnoringSafeArea(.all)
            
                HStack {
                    VStack{
                        Text("'\(song.song_title)'\nBy: \(song.artist)")
                    }
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .frame(width:300)
                    
                    favoriteButton(liked: $modelData.songs[songIndex].liked)
                }
                .foregroundColor(.accentColor)
                
            Group
            {
                Button {
                    withAnimation {
                        showTheory.toggle()
                    }
                        

                } label: {
                    Label("Theory", systemImage: "music.note")
                        .imageScale(.large)
                        .scaleEffect(showTheory ? 1.5 : 1)
                        .padding()
                    
                }
                if (showTheory)
                {
                    withAnimation()
                    {
                        songTheory(song: song)
                    }
                        
                    
                    
                }
                
            }
            
            Button {
                withAnimation {
                    showCharachteristics.toggle()
                }
                    
                
            } label: {
                Label("Characteristics", systemImage: "music.note.list")
                    .imageScale(.large)
                    .scaleEffect(showCharachteristics ? 1.5 : 1)
                    .padding()
                
            }
            if (showCharachteristics)
            {
                withAnimation {
                    songCarachteristics(song: song)
                }
                   
                
                
                
                
                
            }
            
            
            
            
        }
        .padding(.horizontal, 100.0)
        .background(.black)
            
            }
        
    
        
   
        }
        
    


struct songDetail2_Previews: PreviewProvider {
    
    static let modelData = ModelData()
    
    static var previews: some View {
        var songs = ModelData().songs
        songDetail2(song: songs[0])
            .environmentObject(modelData)
    }
}
