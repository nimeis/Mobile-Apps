//
//  songCarachteristics.swift
//  Standalone
//
//  Created by Nico Meiswinkel on 1/30/23.
//

import SwiftUI

extension Animation {
    static func ripple(delay: Double) -> Animation {
            Animation.spring(dampingFraction: 0.3)
                .speed(2)
                .delay(delay)
        }
}

struct songCarachteristics: View {
    @State var delay = 0
    @EnvironmentObject var modelData: ModelData
    var song: Song
    
    var songIndex: Int {
            modelData.songs.firstIndex(where: { $0.id == song.id })!
        }
    
    var body: some View {

                VStack(alignment: .leading){
                    Group{
                        Text("Acousticness")
                            .colorInvert()
                            capsule(color: .red, width: CGFloat(song.adustedAcusticness))
                            .animation(.ripple(delay:0.02))
                        
                    }
                    
                    Group{
                        Text("Dancability")
                            .colorInvert()
                        capsule(color: .blue, width: CGFloat(song.adustedDanceability))
                            .animation(.ripple(delay:0.04))
                    }
                    
                    Group{
                        Text("Energy")
                            .colorInvert()
                        capsule(color: .green, width: CGFloat(song.adustedEnergy))
                            .animation(.ripple(delay:0.06))
                    }
                    
                    Group{
                        Text("Instrumentalness")
                            .colorInvert()
                        capsule(color: .yellow, width: CGFloat(song.adustedInstrumentalness))
                            .animation(.ripple(delay:0.08))
                    }
                    
                    Group{
                        Text("Liveness")
                            .colorInvert()
                        capsule(color: .orange, width: CGFloat(song.adustedLiveness))
                            .animation(.ripple(delay:0.10))
                    }
                    
                    Group{
                        Text("Loudness")
                            .colorInvert()
                        capsule(color: .purple, width: CGFloat(song.adustedLoudness))
                            .animation(.ripple(delay:0.12))
                    }
                    
                    Group{
                        Text("Speechiness")
                            .colorInvert()
                        capsule(color: .mint, width: CGFloat(song.adustedSpeechiness))
                            .animation(.ripple(delay:0.14))
                            
                    }
                    
                }
                
            }
            
        }
        
        
        
struct songCarachteristics_Previews: PreviewProvider {
    static var previews: some View {
        var songs = ModelData().songs
        songCarachteristics(song: songs[0])
    }
}
