//
//  selfEvaluationRow.swift
//  Remission  Index
//
//  Created by Nico Meiswinkel on 2/10/23.
//

import SwiftUI

struct selfEvaluationRow: View {
    var body: some View {
        VStack{
            Text("Self Evaluation")
                .font(.title2)
            previousSEScores()
        }
        .frame(height: 110)
        .background(.blue)
    }
        
}

struct selfEvaluationRow_Previews: PreviewProvider {
    static var previews: some View {
        selfEvaluationRow()
    }
}
