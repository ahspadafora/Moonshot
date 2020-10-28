//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Amber Spadafora on 10/28/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import Foundation

extension Bundle {
    
    func decodeJSON<T: Codable>(_ file: String) -> T {
        
        // get url for json file passed in through file argument
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        // get data from file url
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        // create an instance of JSONDecoder and decode an instance of [Astronaut] from data
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file)")
        }
        return loaded
        
    }
}
