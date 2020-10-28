//
//  Mission.swift
//  Moonshot
//
//  Created by Amber Spadafora on 10/28/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import Foundation


// an example of a nested struct, which is useful to keep your code organized

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var crewString: String {
        var str = ""
        for i in 0..<crew.count {
            if i == crew.count - 1 {
                str.append("\(crew[i].name.capitalized)")
            } else {
                str.append("\(crew[i].name.capitalized), ")
            }
        }
        return str
    }
    
    var formattedLaunchDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: launchDate)
        } else {
            return "N/A"
        }
    }
    
}
