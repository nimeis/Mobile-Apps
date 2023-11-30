//
//  songList.swift
//  Standalone
//
//  Created by Nico Meiswinkel on 1/30/23.
//

import SwiftUI


struct songList: View {
    
    
    
    
    @EnvironmentObject var modelData: ModelData
    @State private var showLikedOnly = false
    @State private var searchText:String = ""
    @State private var searching = false;
    
    @State private var showFilter = false
    @State var filterAcousticness:Float = 0
    @State var filterDanceability:Float = 0
    @State var filterEnergy:Float = 0
    @State var filterInstrumentalness:Float = 0
    @State var filterLiveness:Float = 0
    @State var filterLoudness:Float = 0
    @State var filterSpeechiness:Float = 0
    
    var sortedSongs: [Song] {
        modelData.songs.sorted { Song0, Song1 in
            (Song0.song_title < Song1.song_title)
        }
    }
    var filteredSongs: [Song] {
        sortedSongs.filter { song in
            ((!showLikedOnly || song.liked)
             && (searchText.isEmpty || song.song_title.contains(searchText) || song.artist.contains(searchText))
            && (song.acousticness > filterAcousticness)
            && (song.danceability > filterDanceability)
            && (song.instrumentalness > filterInstrumentalness)
            && (song.energy > filterEnergy)
            && (song.liveness > filterLiveness)
            && (abs(song.loudness) > filterLoudness)
            && (song.speechiness > filterSpeechiness))
            
        }
    }
    
    
    
    var body: some View {
        
        
        NavigationView{
            
                
            List{
                Section{
                    Button {
                        withAnimation{
                            showFilter.toggle()
                        }
                    } label: {
                        Label("Filter Songs", systemImage: "music.note")
                            .padding()
                            .multilineTextAlignment(.center)
                            .imageScale(.large)
                            .scaleEffect(showFilter ? 1.5 : 1)
                            .foregroundColor(.purple)
                        
                    }
                    if(showFilter)
                    {
                        filterSelection(filterAcousticness: $filterAcousticness, filterDanceability: $filterDanceability, filterEnergy: $filterEnergy, filterInstrumentalness: $filterInstrumentalness, filterLiveness: $filterLiveness, filterLoudness: $filterLoudness, filterSpeechiness: $filterSpeechiness, showLikedOnly: $showLikedOnly)
                    }
                }
                .listRowBackground(Color.black)
                
                
                

                
                ForEach(filteredSongs) { song in
                    NavigationLink {
                        
                        ZStack {
                            
                                songDetail2(song: song)
                            }
                            
                            
                                
                    } label: {
                        songRow(song: song)
                        
                        
                    }
                    .listRowBackground(Color.purple)
                    
                }
                .background(.purple)
                .scrollContentBackground(.hidden)
                Section{
                    if (filteredSongs.isEmpty)
                    {
                        Text("Sorry, no songs match your criteria")
                            .font(.title2)
                            
                    }
                }
                .listRowBackground(Color.purple)
                
                    
                    
            }
            .navigationTitle("Songs")
            .background(.purple)
            .scrollContentBackground(.hidden)
            
        }
        .listStyle(.plain )
        .searchable(text: $searchText,prompt: "Search Songs")
        .accentColor(.purple)
        
        
        
    }
    
    
    
    struct LandmarkList_Previews: PreviewProvider {
        static var previews: some View {
            
            songList()
                .environmentObject(ModelData())
            
            
        }
    }
}
