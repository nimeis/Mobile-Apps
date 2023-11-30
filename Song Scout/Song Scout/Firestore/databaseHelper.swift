//
//  databaseHelper.swift
//  Song Scout
//
//  Created by Nico Meiswinkel on 4/24/23.
//

import Foundation

import Firebase
enum dataBaseServiceError: Error {
    case unexpectedError
}

class databaseHelper: ObservableObject {
    var uid: String? = nil
    static let shared = databaseHelper()
    private let db = Firestore.firestore()
    // Some of the iOS Firebase library’s methods are currently a little…odd.
    // They execute synchronously to return an initial result, but will then
    // attempt to write to the database across the network asynchronously but
    // not in a way that can be checked via try async/await. Instead, a
    // callback function is invoked containing an error _if it happened_.
    // They are almost like functions that return two results, one synchronously
    // and another asynchronously.
    //
    // To deal with this, we have a published variable called `error` which gets
    // set if a callback function comes back with an error. SwiftUI views can
    // access this error and it will update if things change.
    @Published var error: Error?
    
    func storeSeeds(userId: String, selectedGenres: [String]) {
        let userRef = db.collection("users").document(userId)
        userRef.getDocument {documentSnapshot, error in
            if let documentSnapshot = documentSnapshot, documentSnapshot.exists {
                userRef.updateData([
                    "seedGenres": FieldValue.arrayUnion([selectedGenres])
                ]) { error in
                    if let error = error {
                        print("Error updating seedGenres: \(error.localizedDescription)")
                    } else {
                        print("Successfully updated seedGenres")
                    }
                }
            } else {
                userRef.setData([
                    "seedGenres": [selectedGenres]
                ]) { error in
                    if let error = error {
                        print("Error creating seedGenres: \(error.localizedDescription)")
                    } else {
                        print("Successfully created seedGenres")
                    }
                }
            }
        }
    }
    
    func retrieveSeeds(currentUser: User?, completion: @escaping (Result<[[String]], Error>) -> Void) { print("IM INSIDE RETRIEVE SEEDs")
        guard let user = currentUser else {
            completion(.failure(NSError(domain: "FirebaseAuth", code: 0, userInfo: [NSLocalizedDescriptionKey: "User not signed in"])))
            return
        }
        let userRef = db.collection("users").document(user.uid)
        userRef.getDocument{ documentSnapshot, error in
            if let error = error {
                completion(.failure(error))
            } else if let documentSnapshot = documentSnapshot, documentSnapshot.exists {
                let seedGenres = documentSnapshot.get("seedGenres") as? [[String]] ?? []
                print(seedGenres)
                print(documentSnapshot.get("seedGenres"))
                completion(.success(seedGenres))
            } else {
                completion(.failure(NSError(domain: "Firestore", code: 0, userInfo: [NSLocalizedDescriptionKey: "Document does not exist"])))
            }
        }
    }
    
    func loginSpotify(id:String){
        self.uid = id
    }

}


