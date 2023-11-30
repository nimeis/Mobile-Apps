//
//  ContentView.swift
//  Song Scout
//
//  Created by Nico Meiswinkel on 4/24/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var spotifyAPI: spotifyAPI
    
    var body: some View {
        testView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(spotifyAPI())
    }
}
