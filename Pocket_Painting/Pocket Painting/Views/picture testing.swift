//
//  picture testing.swift
//  Pocket Painting
//
//  Created by Nico Meiswinkel on 3/9/23.
//

import SwiftUI

struct picture_testing: View {
    
    @State var img:dalleResponse
    
    
    var body: some View {
        VStack{
            
            Task {
                do{
                    img = try await postMethod()
                } catch{
                    print("error")
                }
            }
            
            AsyncImage(url: URL(string: img.images[0]))
        }
    }
    
    func loadImage() async{
        do{
        img = try await postMethod()
        } catch{
            print("error")
        }
    }
}

struct picture_testing_Previews: PreviewProvider {
    static var previews: some View {
        picture_testing()
    }
}
