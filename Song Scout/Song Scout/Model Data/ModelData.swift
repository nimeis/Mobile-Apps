//
//  ModelData.swift
//  Song Scout
//
//  Created by Nico Meiswinkel on 4/24/23.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    
    //Any model data gets initialized here make sure it is @ published
    //Load data from JSON EX: @Published var sections: [surveySection] = load("survey.json")
    //Initilize data EX: @Published var welcomeMessages:[String] = ["Welcome","Hope your having a good day"]
    
}
    
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
