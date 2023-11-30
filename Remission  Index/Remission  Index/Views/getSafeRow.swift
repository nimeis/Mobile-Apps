//
//  getSafeRow.swift
//  Remission  Index
//
//  Created by Nico Meiswinkel on 2/10/23.
//

import SwiftUI

struct getSafeRow: View {
    var body: some View {
        VStack{
            Text("Get Safer")
                .font(.title2)
            previousGSScores()
        }
        .frame(height: 110)
        .background(.blue)
    }
}

struct getSafeRow_Previews: PreviewProvider {
    static var previews: some View {
        getSafeRow()
    }
}
