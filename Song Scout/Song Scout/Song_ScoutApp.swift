//
//  Song_ScoutApp.swift
//  Song Scout
//
//  Created by Nico Meiswinkel on 4/24/23.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuthUI
import FirebaseGoogleAuthUI

@main
struct Song_Scout: App {
    @UIApplicationDelegateAdaptor(Song_ScoutDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(fireStoreAuth())
                .environmentObject(databaseHelper.shared)
                .environmentObject(spotifyAPI.shared)
        }
    }
}
