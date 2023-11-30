//
//  ContentView.swift
//  Remission  Index
//
//  Created by Nico Meiswinkel on 2/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        welcomeView()
            .environmentObject(ModelData())
    }
}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
