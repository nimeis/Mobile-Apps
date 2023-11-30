//
//  StandaloneApp.swift
//  Standalone
//
//  Created by Nico Meiswinkel on 1/23/23.
//

import SwiftUI

@main
struct StandaloneApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
