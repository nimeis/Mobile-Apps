//
//  SwiftUIView.swift
//  Remission  Index
//
//  Created by Nico Meiswinkel on 2/10/23.
//

import SwiftUI

struct welcomeView: View {
    @EnvironmentObject var modelData: ModelData
    let now = Date.now
    @State var requestLogin = true;
    @EnvironmentObject var auth: fireStoreAuth
    @EnvironmentObject var dbService: surveyDatabaseHelper
    

    
    
    
    
    var body: some View {
        
        let welcomeMessage:String = modelData.welcomeMessages.randomElement()!
        
        VStack {
            HStack
            {
                if let userImage = auth.user?.photoURL?.absoluteURL{
                    AsyncImage(url: userImage)
                }
                VStack{
                    Text(Date.now, format: .dateTime.day().month().year())
                    Text(Date.now, format: .dateTime.hour().minute())
                    if let name = auth.user?.displayName{
                        Text(welcomeMessage + " " + name)
                    }
                    else{
                        Text(welcomeMessage)
                    }
                }
                
            }
            
                TabView{
                    
                    submissionBlogView()
                        .tabItem {
                            Label("See how others are doing",systemImage: "arrow.left")
                        }
                    
                    surveyVeiw()
                        .tabItem {
                            Label("Today",systemImage: "star")
                        }
                    
                    previousScoresView()
                        .tabItem {
                            Label("Looking back",systemImage: "arrow.right")
                        }
                }.sheet(isPresented: $requestLogin) {
                    if let ui = auth.authUI{
                        AuthenticationViewController(authUI: ui)
                            .onDisappear{
                                let seconds = 0.5
                                DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                                    print("Veiw disappeared")
                                    if let user = auth.user{
                                        dbService.setUser(user: user)
                                    }
                                }
                                
                            
                        }
                }
                }
                
                    
        }
    }
    func login(){
        if let user = auth.user{
            dbService.setUser(user: user)
            requestLogin = false
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        welcomeView()
            .environmentObject(ModelData())
    }
}
