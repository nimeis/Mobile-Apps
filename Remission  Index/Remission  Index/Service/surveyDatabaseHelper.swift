//
//  surveyDatabaseHelper.swift
//  Remission  Index
//
//  Created by Nico Meiswinkel on 3/22/23.
//

import Foundation



import Firebase

let COLLECTION_NAME = "Users"
var DEFAULT_PFP = "https://w7.pngwing.com/pngs/753/432/png-transparen…fault-business-angle-service-people-thumbnail.png"

var document_name:String?

enum SurveyServiceError: Error {
    case unexpectedError
}

class surveyDatabaseHelper: ObservableObject {
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
    
    func setUser(user: User){
        document_name = user.uid
        db.collection(COLLECTION_NAME).document(document_name!).setData([
            "name": user.displayName,
            "email": user.email,
            "potoURL": user.photoURL?.absoluteString
            
        ],merge: true) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    func getPreviousSectionData(sectionIndex:Int) async throws -> [previousScoreSnapshot]{
        let submissionQuery = db.collection(COLLECTION_NAME).document(document_name!).collection("submissions")
            .order(by: "date",descending: true)
            .limit(to: 6)
        let querySnapshot = try await submissionQuery.getDocuments()
        return try querySnapshot.documents.map{
            // This is likely new Swift for you: type conversion is conditional, so they
            // must be guarded in case they fail.
            guard let dateAsTimestamp = $0.get("date") as? Timestamp,
                  let sectionScore = $0.get("section\(sectionIndex)") as? Int
                    
            else{
                throw SurveyServiceError.unexpectedError
            }
            return previousScoreSnapshot(id: UUID().uuidString, date: dateAsTimestamp.dateValue(), sectionScore: sectionScore)
        }
    }
    var userName:String?
    
    func fetchUserData(userRef:DocumentReference) {
        // Create a dispatch group
        let group = DispatchGroup()

        // Enter the dispatch group
        group.enter()

        // Fetch data from Firestore document
        userRef.getDocument { (documentSnapshot, error) in
            defer {
                // Leave the dispatch group, even if an error occurs
                group.leave()
            }

            if let error = error {
                // Handle any errors that occur during fetching
                print("Error fetching user data: \(error.localizedDescription)")
            } else {
                // Extract the values from the document snapshot
                self.userName = documentSnapshot?.get("name") as? String


                // Data fetching completed successfully
                print("User data fetched successfully")
            }
        }

        // Wait for the dispatch group to complete before proceeding
        group.wait()
    }


    func getDaysSubmissions(date:Date) async throws -> [userSubmission]{
        let startOfDay = Calendar.current.startOfDay(for: date)
        let endOfDay = Calendar.current.date(byAdding: .day, value: 1, to: startOfDay)
        let submissionQuery = db.collectionGroup("submissions")
            .whereField("date", isGreaterThan: Timestamp(date: startOfDay))
            .whereField("date", isLessThan: Timestamp(date: endOfDay!))
            .order(by: "date", descending: true)
            .limit(to: 10)
        
        let querySnapshot = try await submissionQuery.getDocuments()
        
        return try querySnapshot.documents.map{
            // This is likely new Swift for you: type conversion is conditional, so they
            // must be guarded in case they fail.
            guard let dateAsTimestamp = $0.get("date") as? Timestamp,
                  let userRef = $0.reference.parent.parent as DocumentReference?,
                  let section0Score = $0.get("section0") as? Int,
                  let section1Score = $0.get("section1") as? Int,
                  let section2Score = $0.get("section2") as? Int,
                  let section3Score = $0.get("section3") as? Int,
                  let section4Score = $0.get("section4") as? Int,
                  let section5Score = $0.get("section5") as? Int,
                  let section6Score = $0.get("section6") as? Int,
                  let section7Score = $0.get("section7") as? Int,
                  let section8Score = $0.get("section8") as? Int,
                  let section9Score = $0.get("section9") as? Int
                    
            else{
                throw SurveyServiceError.unexpectedError
            }
            
            
           fetchUserData(userRef: userRef)
            

            
            let sub = submission(id: UUID().uuidString, date: dateAsTimestamp.dateValue(), section0: section0Score, section1: section1Score, section2: section2Score, section3: section3Score, section4: section4Score, section5: section5Score, section6: section6Score, section7: section7Score, section8: section8Score, section9: section9Score)
            

            return userSubmission(id: UUID().uuidString, userName: userName, submission: sub)
                
        }
        
    }
    
     func getLastSubmissionDate() async throws -> Date?{
        let submissionQuery = db.collection(COLLECTION_NAME).document(document_name!).collection("submissions")
            .order(by: "date",descending: true)
            .limit(to: 1)
        
        let querySnapshot = try await submissionQuery.getDocuments()
        
         let date =  try querySnapshot.documents.map{
            // This is likely new Swift for you: type conversion is conditional, so they
            // must be guarded in case they fail.
            guard let dateAsTimestamp = $0.get("date") as? Timestamp
            else{
                throw SurveyServiceError.unexpectedError
            }
        
                    return dateAsTimestamp.dateValue()
            }
         if(date.count < 1){
             return nil
         }
         else{
             return date[0]
         }
            
    }

    func submitSurvey(submission: submission) -> String {
        var ref: DocumentReference? = nil
        
        // addDocument is one of those “odd” methods.
        ref = db.collection(COLLECTION_NAME).document(document_name!).collection("submissions").addDocument(data: [
            "date": submission.date,
            "section0": submission.section0,
            "section1": submission.section1,
            "section2": submission.section2,
            "section3": submission.section3,
            "section4": submission.section4,
            "section5": submission.section5,
            "section6": submission.section6,
            "section7": submission.section7,
            "section8": submission.section8,
            "section9": submission.section9
        ]) { possibleError in
            if let actualError = possibleError {
                self.error = actualError
            }
        }
        
        // If we don’t get a ref back, return an empty string to indicate “no ID.”
        return ref?.documentID ?? ""
    }
}
