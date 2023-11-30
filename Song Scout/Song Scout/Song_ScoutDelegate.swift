//
//  Song_ScoutDelegate.swift
//  Song Scout
//
//  Created by Nico Meiswinkel on 4/24/23.
//

import Foundation
import UIKit

import Firebase

class Song_ScoutDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions:
                     [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
