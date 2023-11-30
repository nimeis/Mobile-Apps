//
//  dalleImage.swift
//  Pocket Painting
//
//  Created by Nico Meiswinkel on 3/9/23.
//

import SwiftUI

struct dalleImage: View {
    
    var Image:dalleImageModel
        
    
    var body: some View {
        
            
                AsyncImage(url: URL(string: Image.url))
        
    }
}

struct dalleImage_Previews: PreviewProvider {
    static var previews: some View {
        let imgs = dalleImageModel(url: "https://oaidalleapiprodscus.blob.core.windows.net/private/org-w9usWF6P5jgEtlmyc4UnefLj/user-AUwUiB2jpywvE394hEed6nQi/img-mBfU5wPOO7NAuOVHLFO6JjLV.png?st=2023-03-13T15%3A03%3A31Z&se=2023-03-13T17%3A03%3A31Z&sp=r&sv=2021-08-06&sr=b&rscd=inline&rsct=image/png&skoid=6aaadede-4fb3-4698-a8f6-684d7786b067&sktid=a48cca56-e6da-484e-a814-9c849652bcb3&skt=2023-03-13T15%3A45%3A28Z&ske=2023-03-14T15%3A45%3A28Z&sks=b&skv=2021-08-06&sig=jLZ1c8hojMJH8W069yL2BfJDsv8lH7y5oZ6d2xZwkl0%3D")
        
        dalleImage(Image: imgs)
    }
}
