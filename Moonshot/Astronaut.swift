//
//  Astronaut.swift
//  Moonshot
//
//  Created by Amber Spadafora on 10/28/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import Foundation

// made Astronaut conform to Codable so we can create instances of this struct straight from JSON

// made Astronaut conform to Identifiable so we can use arrays of astronauts inside ForEach loops (and more)

struct Astronaut: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
}
