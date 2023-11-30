//
//  WaveformView.swift
//  Song Scout
//
//  Created by madsk on 4/26/23.
//

import SwiftUI
import AVFoundation

struct WaveformView: View {
    let audioAnalysis: AudioAnalysis
    @Binding var progress: Double
    
    let colors = Gradient(colors: [Color.red, Color.yellow, Color.green])
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color.gray)
                GeometryReader { geo in
                    ForEach(audioAnalysis.beats, id: \.start) { beat in
                        let x = CGFloat(beat.start / audioAnalysis.segments.last!.start) * geo.size.width
                        let width = CGFloat(beat.duration / audioAnalysis.segments.last!.start) * geo.size.width
                        Rectangle()
                            .fill(LinearGradient(gradient: colors, startPoint: .leading, endPoint: .trailing))
                            .frame(width: width, height: geo.size.height)
                            .offset(x: x)
                    }
                }
                .frame(height: geometry.size.height)
                .clipped()
                .offset(x: -CGFloat(progress) * geometry.size.width)
            }
        }
    }
    
    private func beat(at time: Double) -> AudioAnalysis.AudioSegment? {
        return audioAnalysis.beats.first(where: { beat in
            beat.start <= time && beat.start + beat.duration >= time
        })
    }
}
