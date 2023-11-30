//
//  skilledAdvocateRow.swift
//  Remission  Index
//
//  Created by Nico Meiswinkel on 2/10/23.
//

import SwiftUI

struct skilledAdvocateRow: View {
    var body: some View {
        VStack{
            Text("Skilled Advocate")
                .font(.title2)
            previousSEScores()
        }
        .frame(height: 110)
        .background(.blue)
    }
}

struct skilledAdvocateRow_Previews: PreviewProvider {
    static var previews: some View {
        skilledAdvocateRow()
    }
}
