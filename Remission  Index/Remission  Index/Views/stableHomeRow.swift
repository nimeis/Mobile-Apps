//
//  stableHomeRow.swift
//  Remission  Index
//
//  Created by Nico Meiswinkel on 2/10/23.
//

import SwiftUI

struct stableHomeRow: View {
    var body: some View {
        VStack{
            Text("Stable Home")
                .font(.title2)
            previousSEScores()
        }
        .frame(height: 110)
        .background(.blue)

    }
}

struct stableHomeRow_Previews: PreviewProvider {
    static var previews: some View {
        stableHomeRow()
    }
}
