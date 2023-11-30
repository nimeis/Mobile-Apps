//
//  spotifyAuthenticationViewController.swift
//  Song Scout
//
//  Created by Nico Meiswinkel on 4/25/23.
//

import SwiftUI
import UIKit
import WebKit

class spotifyViewController: UIViewController {
    var onSignedIn: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAuthCodeFromWebView()
    }
    
    func getAuthCodeFromWebView(){
        guard let urlRequest = spotifyAPI.shared.getAuthCodeURL() else {return}
        let webView = WKWebView()
        webView.load(urlRequest)
        webView.navigationDelegate = self
        view = webView
    }
    
    func syncRefreshToken() {
        Task{
            try await spotifyAPI.shared.refreshToken()
        }
    }
    
    func startRefreshing(){
        let newTimer = Timer(timeInterval: Double(spotifyAPI.shared.accessToken!.expires_in), repeats: true) { newTimer in
           self.syncRefreshToken()
       }
       RunLoop.current.add(newTimer, forMode: .common)
   }
}


extension spotifyViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        guard let urlString = webView.url?.absoluteString else {return}
        print(urlString)
        if urlString.contains("?code="){
            let range = urlString.range(of: "?code=")
            guard let index = range?.upperBound else {return}
            let codeString = String(urlString[index...])
            Task{
                do{
                    spotifyAPI.shared.accessToken = try await spotifyAPI.shared.getAccessToken(accessCode: codeString)
                    var user: spotifyUser? = try await spotifyAPI.shared.getUserInfo()
                    if let u = user{
                        databaseHelper.shared.loginSpotify(id: u.id)
                    }
                    startRefreshing()
                }catch{
                    print(error.localizedDescription)
                }
            }
            webView.removeFromSuperview()
            dismiss(animated: false)
            onSignedIn?()
        }
    }
}
