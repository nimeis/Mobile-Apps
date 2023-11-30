//
//  filterSelection.swift
//  Standalone
//
//  Created by Nico Meiswinkel on 1/30/23.
//

import SwiftUI

struct filterSelection: View {
    @Binding var filterAcousticness:Float
    @Binding var filterDanceability:Float
    @Binding var filterEnergy:Float
    @Binding var filterInstrumentalness:Float
    @Binding var filterLiveness:Float
    @Binding var filterLoudness:Float
    @Binding var filterSpeechiness:Float
    @Binding var showLikedOnly:Bool
    
    var body: some View {
        VStack{
            
            Group {
                Toggle(isOn: $showLikedOnly){
                    Text("Liked Songs")}
            }
            
            Group {
                Text("Acousticness: \(filterAcousticness,specifier: "%.1f")")
                    
                Slider(value: $filterAcousticness, in: 0...1)
            }
            
                
            Group {
                Text("Danceability: \(filterDanceability,specifier: "%.1f")")
                Slider(value: $filterDanceability, in: 0...1)
            }
            
                
            Group {
                Text("Energy: \(filterEnergy,specifier: "%.1f")")
                Slider(value: $filterEnergy, in: 0...1)
            }
            
                
            Group {
                Text("Instrumentalness: \(filterInstrumentalness,specifier: "%.1f")")
                Slider(value: $filterInstrumentalness, in: 0...1)
            }
                
                
            Group {
                Text("Liveness: \(filterLiveness,specifier: "%.1f")")
                Slider(value: $filterLiveness, in: 0...1)
            }
                
                
            Group {
                Text("Loudness: \(filterLoudness,specifier: "%.1f")")
                Slider(value: $filterLoudness, in: 0...15)
            }
                
                
            Group {
                Text("Speechniess: \(filterSpeechiness,specifier: "%.1f")")
                Slider(value: $filterSpeechiness, in: 0...1)
            }
                
                
            }
        .foregroundColor(.purple)
            }
            
        }
    

struct filterSelection_Previews: PreviewProvider {
    static var previews: some View {
        filterSelection(filterAcousticness: .constant(0.5),filterDanceability:.constant(0.5),filterEnergy:.constant(0.5),filterInstrumentalness:.constant(0.5),filterLiveness:.constant(0.5),filterLoudness:.constant(0.5),filterSpeechiness:.constant(0.5), showLikedOnly: .constant(true))
    }
}
