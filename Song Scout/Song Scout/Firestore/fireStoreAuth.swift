//
//  fireStoreAuth.swift
//  Song Scout
//
//  Created by Nico Meiswinkel on 4/24/23.
//

import Foundation

import FirebaseAuthUI
import FirebaseGoogleAuthUI

class fireStoreAuth: NSObject, ObservableObject, FUIAuthDelegate {
    let authUI: FUIAuth? = FUIAuth.defaultAuthUI()
    @Published var user: User?
    /**
     * You might not have overriden a constructor in Swift before...well, here it is.
     */
    override init() {
        super.init()
        // Note that authUI is marked as _optional_. If things don’t appear to work
        // as expected, check to see that you actually _got_ an authUI object from
        // the Firebase library.
        authUI?.delegate = self
        // Multiple providers can be supported! See: https://firebase.google.com/docs/auth/ios/firebaseui
        let providers: [FUIAuthProvider] = [
            FUIGoogleAuth(authUI: authUI!)
        ]
        authUI?.providers = providers
    }
    /**
     * In another case of the documentation being somewhat behind the latest libraries,
     * this delegate method:
     *
     *     func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?)
     *
     * …has been deprecated in favor of the one below.
     */
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        if let actualResult = authDataResult {
            user = actualResult.user
            print("signed in")
        }
    }

    func signOut() throws {
        try authUI?.signOut()
        // If we get past the logout attempt, we can safely clear the user.
        user = nil
    }
}
