//
//  remissionIndexDelegate.swift
//  Remission  Index
//
//  Created by Nico Meiswinkel on 3/22/23.
//

import Foundation
import UIKit

import Firebase

class remissionIndexDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions:
                     [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }
    
}
