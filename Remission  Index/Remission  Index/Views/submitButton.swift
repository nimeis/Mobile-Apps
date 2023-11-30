//
//  submitButton.swift
//  Remission  Index
//
//  Created by Nico Meiswinkel on 2/13/23.
//

import SwiftUI
import Firebase

struct submitButton: View {
    @EnvironmentObject var service:surveyDatabaseHelper
    
    
    var body: some View {
        Button("submit")
        {
            
        }
    }
}

struct submitButton_Previews: PreviewProvider {
    static var previews: some View {
        submitButton()
    }
}
