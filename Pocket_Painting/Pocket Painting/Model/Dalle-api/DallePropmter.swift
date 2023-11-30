//
//  DallePropmter.swift
//  Pocket Painting
//
//  Created by Nico Meiswinkel on 3/8/23.
//

import Foundation

let IMAGE_URL_ROOT = "https://api.openai.com/v1/images/generations"
let COMPLETION_URL_ROOT = "https://api.openai.com/v1/completions"
let DALLE_KEY = "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"

enum dalleAPIError: Error {
    case imagesnotdecoded
    case unexpectedAPIError
}
func enhancedPrompt(prompt: String) async throws -> String{
    guard let completion_url = URL(string: COMPLETION_URL_ROOT) else {
        print("Error: cannot create URL")
        fatalError("URL didnt work")
    }
    
    // Create model
    struct completionPromptBody: Codable {
        let model: String
        let prompt: String
        let max_tokens: Int
        let temperature: Int
    }
    
    let completionRequestBody = completionPromptBody(model: "text-davinci-003", prompt: "Describe an image of \(prompt)", max_tokens: 40, temperature: 0)
    
    // Convert model to JSON data
    guard let completionJson = try? JSONEncoder().encode(completionRequestBody) else {
        print("Error: Trying to convert model to JSON data")
        fatalError("couldnt convert model to json")
    }
    print(String(bytes: completionJson, encoding: String.Encoding.utf8) ?? "NIL")
    // Create the url request
    var completionRequest = URLRequest(url: completion_url)
    completionRequest.httpMethod = "POST"
    completionRequest.setValue( "Bearer \(DALLE_KEY)", forHTTPHeaderField: "Authorization") //AUTHENTICAION
    completionRequest.setValue("application/json", forHTTPHeaderField: "Content-Type") // the request is JSON
    completionRequest.httpBody = completionJson
    
    let (cdata, _) = try await URLSession.shared.data(for: completionRequest)
    print(String(bytes: cdata, encoding: String.Encoding.utf8) ?? "NIL")
    guard let decodedCompletion = try? JSONDecoder().decode(completionResponse.self, from: cdata) else{
        print("completion response not decoded")
        fatalError("couldnt convert model from json")
    }
    return decodedCompletion.choices[0].text
}

func enchancedImageGeneration(prompt: String) async throws -> dalleResponse{
    
    let imgSize = "256x256"
    
    guard let completion_url = URL(string: COMPLETION_URL_ROOT) else {
        print("Error: cannot create URL")
        fatalError("URL didnt work")
    }
    
    guard let image_url = URL(string: IMAGE_URL_ROOT) else {
        print("Error: cannot create URL")
        fatalError("URL didnt work")
    }
    
    // Create model
    struct completionPromptBody: Codable {
        let model: String
        let prompt: String
        let max_tokens: Int
        let temperature: Int
    }
    
    struct imagePromptBody: Codable {
        let prompt: String
        let n: Int
        let size: String
    }
    
    // Add data to the model
    let completionRequestBody = completionPromptBody(model: "text-davinci-003", prompt: "Describe an image of \(prompt)", max_tokens: 50, temperature: 0)
    
    
    
    // Convert model to JSON data
    guard let completionJson = try? JSONEncoder().encode(completionRequestBody) else {
        print("Error: Trying to convert model to JSON data")
        fatalError("couldnt convert model to json")
    }
    print(String(bytes: completionJson, encoding: String.Encoding.utf8) ?? "NIL")
    // Create the url request
    var completionRequest = URLRequest(url: completion_url)
    completionRequest.httpMethod = "POST"
    completionRequest.setValue( "Bearer \(DALLE_KEY)", forHTTPHeaderField: "Authorization") //AUTHENTICAION
    completionRequest.setValue("application/json", forHTTPHeaderField: "Content-Type") // the request is JSON
    completionRequest.httpBody = completionJson
    
    let (cdata, _) = try await URLSession.shared.data(for: completionRequest)
    print(String(bytes: cdata, encoding: String.Encoding.utf8) ?? "NIL")
    guard let decodedCompletion = try? JSONDecoder().decode(completionResponse.self, from: cdata) else{
        print("completion response not decoded")
        fatalError("couldnt convert model from json")
    }
    
    let imageRequestBody = imagePromptBody(prompt: decodedCompletion.choices[0].text, n: 3, size: imgSize)
    guard let imageJson = try? JSONEncoder().encode(imageRequestBody) else {
        print("Error: Trying to convert model to JSON data")
        fatalError("couldnt convert model to json")
    }
    var imageRequest = URLRequest(url: image_url)
    imageRequest.httpMethod = "POST"
    imageRequest.setValue( "Bearer \(DALLE_KEY)", forHTTPHeaderField: "Authorization") //AUTHENTICAION
    imageRequest.setValue("application/json", forHTTPHeaderField: "Content-Type") // the request is JSON
    imageRequest.httpBody = imageJson

    let (idata, _) = try await URLSession.shared.data(for: imageRequest)
    print(String(bytes: idata, encoding: String.Encoding.utf8) ?? "NIL")
        if let decodedimages = try? JSONDecoder().decode(dalleResponse.self, from: idata) {
            print(decodedimages)
            return decodedimages
        } else {
            throw dalleAPIError.imagesnotdecoded
        }
}
func imageGeneration(prompt: String, n: Int) async throws -> dalleResponse{
    
    let imgSize = "256x256"
    
    guard let url = URL(string: IMAGE_URL_ROOT) else {
        print("Error: cannot create URL")
        fatalError("URL didnt work")
    }
    
    // Create model
    struct promptBody: Codable {
        let prompt: String
        let n: Int
        let size: String
    }
    
    
    // Add data to the model
    let requestBody = promptBody(prompt: prompt, n: n, size: imgSize)
    
    
    
    // Convert model to JSON data
    guard let jsonData = try? JSONEncoder().encode(requestBody) else {
        print("Error: Trying to convert model to JSON data")
        fatalError("couldnt convert model to json")
    }
    print(String(bytes: jsonData, encoding: String.Encoding.utf8) ?? "NIL")
    // Create the url request
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue( "Bearer \(DALLE_KEY)", forHTTPHeaderField: "Authorization") //AUTHENTICAION
    request.setValue("application/json", forHTTPHeaderField: "Content-Type") // the request is JSON
    request.httpBody = jsonData
    
    let (data, _) = try await URLSession.shared.data(for: request)
    print(String(bytes: data, encoding: String.Encoding.utf8) ?? "NIL")
        if let decodedimages = try? JSONDecoder().decode(dalleResponse.self, from: data) {
            print(decodedimages)
            return decodedimages
        } else {
            throw dalleAPIError.imagesnotdecoded
        }
    
    
    
}
