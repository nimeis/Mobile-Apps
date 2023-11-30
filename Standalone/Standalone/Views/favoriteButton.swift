//
//  favoriteButton.swift
//  Standalone
//
//  Created by Nico Meiswinkel on 1/31/23.
//

import SwiftUI


struct favoriteButton: View {
    
    @Binding var liked:Bool

    
    var body: some View {
        Button {
            withAnimation{
                liked.toggle()
            }
        } label: {
            Label("Like Button", systemImage: (liked ? "heart.fill" : "heart"))
                .labelStyle(.iconOnly)
                .imageScale(.large)
                .scaleEffect(liked ? 1.5 : 1)
                .rotationEffect(liked ? Angle(degrees: 0) : Angle(degrees: 360))
                .foregroundColor(liked ? .mint : .gray)
                .padding()
            
        }
    }
    
    struct favoriteButton_Previews: PreviewProvider {
        static var previews: some View {
            favoriteButton(liked: .constant(true))
        }
    }
}
