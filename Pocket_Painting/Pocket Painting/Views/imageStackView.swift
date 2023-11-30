//
//  imageStackView.swift
//  Pocket Painting
//
//  Created by Nico Meiswinkel on 3/13/23.
//

import SwiftUI

struct imageStackView: View {
    var styles = ["none","digital art","Realism","cyber punk", "vintage", "3d illistration","cartoon"]
    @State var style:String = "none"
    @State var enhancePrompt = false
    @State var imgs:dalleResponse?
    @State var waitingForPrompt = true
    @State var loading = false
    @State var userPrompt = ""
    @State var prompt = ""
    @State var numPics = 1.0;
    var body: some View {
        VStack{
            Toggle(isOn: $enhancePrompt){
                Text("Enhance Prompt")
            }
            Text("Number of Images: \(numPics.formatted())")
            Slider(value: $numPics, in: 1...8,step: 1)
            Spacer()
            Text("Style")
            Picker("Pick a style", selection: $style){
                ForEach(styles, id: \.self){
                    Text($0)
                }
            }
            TextField("Image Prompt",text: $userPrompt)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal,30)
                .onSubmit {
                    waitingForPrompt = false
                    loading = true
                    Task{
                        if userPrompt != ""
                        {
                            await requestImage()
                        }
                    }
                }
            
            if waitingForPrompt{
                Text("Input Prompt")
            }
            else{
                Text("\(enhancePrompt ? "Enhanced " : "")Prompt: \(prompt)")
            }
            Spacer()
            if loading{

                Spinner()
            }
            else{
                if let images = imgs{
                    ScrollView{
                        ForEach(images.data){ image in
                            dalleImage(Image: image)
                    }
                        .scrollContentBackground(.hidden)
                        .background(.gray)
                    
                    }
                    
                }
            }
        }
    }
    func requestImage() async {
        if(enhancePrompt){
            do{
                prompt = try await enhancedPrompt(prompt: userPrompt)
            }catch{
            }
        }else{
            prompt = userPrompt
        }
        
        prompt =
            "\(prompt) \((style == "none") ? "" : "in the style of \(style)")"
        
        do{
            imgs = try await imageGeneration(prompt: prompt, n: Int(numPics))
                loading = false
        }catch{
            
        }
    }
}

struct imageStackView_Previews: PreviewProvider {
    static var previews: some View {
        imageStackView()
    }
}
