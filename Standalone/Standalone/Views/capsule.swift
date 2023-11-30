//
//  capsule.swift
//  Standalone
//
//  Created by Nico Meiswinkel on 1/30/23.
//

import SwiftUI

struct capsule: View {
    var color: Color
    let maxVal:CGFloat = 275
    var width: CGFloat
    var adjustedWith: CGFloat {
        if (width > maxVal)
        {
            return maxVal
        }
        else
        {
            return width
        }
    }
    
    var body: some View {
        Capsule()
            .fill(color)
            .frame(width: adjustedWith, height: 20)
            
    }
}

struct capsule_Previews: PreviewProvider {
    static var previews: some View {
        capsule(color: .red,width: 100 )
    }
}
