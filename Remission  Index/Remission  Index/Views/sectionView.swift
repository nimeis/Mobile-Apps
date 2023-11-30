//
//  sectionView.swift
//  Remission  Index
//
//  Created by Nico Meiswinkel on 2/10/23.
//

import SwiftUI

struct sectionView: View {
    @EnvironmentObject var modelData: ModelData
    var section:surveySection
    @Binding var score:Float
    var sectionIndex: Int {
            modelData.sections.firstIndex(where: { $0.id == section.id })!
        }
    
    var body: some View {
        VStack{
            Text("\(section.title) \n")
                .font(.title)
            ForEach(section.contents,id: \.self){ content in
                Text("\(content) \n")
            }
            .multilineTextAlignment(.center)
            Slider(value: $modelData.sections[sectionIndex].score, in: 0...10,step: 1)
            Text("\(modelData.sections[sectionIndex].score)")
            
        }
    }
}

struct sectionView_Previews: PreviewProvider {
    static var previews: some View {
        let sections = ModelData().sections
        sectionView(section: sections[9],score: .constant(0))
            .environmentObject(ModelData())
    }
}
