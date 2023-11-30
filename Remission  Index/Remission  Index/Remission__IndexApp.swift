//
//  Remission__IndexApp.swift
//  Remission  Index
//
//  Created by Nico Meiswinkel on 2/10/23.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuthUI
import FirebaseGoogleAuthUI

@main
struct Remission__IndexApp: App {
   
    @UIApplicationDelegateAdaptor(remissionIndexDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(fireStoreAuth())
                .environmentObject(surveyDatabaseHelper())
        }
    }
    
}


