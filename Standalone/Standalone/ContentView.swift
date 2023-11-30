//
//  ContentView.swift
//  Standalone
//
//  Created by Nico Meiswinkel on 1/23/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        songList()
            .environmentObject(ModelData())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
