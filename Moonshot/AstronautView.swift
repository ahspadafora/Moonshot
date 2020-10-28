//
//  AstronautView.swift
//  Moonshot
//
//  Created by Amber Spadafora on 10/28/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    
    let astronaut: Astronaut
    let missions: [Mission]
    
    init(missions: [Mission], astronaut: Astronaut) {
        self.astronaut = astronaut
        var astronautsMissions = [Mission]()
        
        // finds all missions that include this astronaut
        for mission in missions {
            if let _ = mission.crew.first(where: { $0.name == astronaut.id }) {
                astronautsMissions.append(mission)
            }
        }
        self.missions = astronautsMissions
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .clipShape(Rectangle())
                        .padding()
                        .frame(width: geometry.size.width)
                        .layoutPriority(1)
                    Text(self.astronaut.description).font(.body)
                        .padding().layoutPriority(1)
                    
                    AstronautMissionView(missions: self.missions).frame(height: 500).frame(maxWidth: geometry.size.width)
                    
                }
            }
        }.navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decodeJSON("astronauts.json")
    static let missions: [Mission] = Bundle.main.decodeJSON("missions.json")
    
    static var previews: some View {
        AstronautView(missions: missions, astronaut: astronauts[0])
    }
}
