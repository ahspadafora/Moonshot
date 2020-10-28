//
//  MissionView.swift
//  Moonshot
//
//  Created by Amber Spadafora on 10/28/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import SwiftUI

struct MissionView: View {
    
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let astronauts: [CrewMember]
    
    var mission: Mission
    let allMissions: [Mission]
    
    init(mission: Mission, astronauts: [Astronaut], allMissions: [Mission]) {
        self.mission = mission
        
        var matches = [CrewMember]()
        for member in mission.crew {
            if let match = astronauts.first(where: {$0.id == member.name}) {
                matches.append(CrewMember(role: member.role, astronaut: match))
            } else {
                fatalError("Missing \(member)")
            }
        }
        self.astronauts = matches
        self.allMissions = allMissions
    }
   
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    // mission badge image
                    Image(self.mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.75)
                        .padding(.top)
                    if self.mission.formattedLaunchDate != "N/A" {
                        Text("Launch Date: \(self.mission.formattedLaunchDate)")
                    }
                    
                    // mission description
                    Text(self.mission.description).padding()
                    
                    ForEach(self.astronauts, id: \.role) { crewMember in
                        NavigationLink(destination: AstronautView(missions: self.allMissions, astronaut: crewMember.astronaut)) {
                            HStack {
                                Image(crewMember.astronaut.id)
                                    .resizable()
                                    .frame(width: 83, height: 60)
                                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                                    .overlay(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)).stroke(Color.primary, lineWidth: 1))
                                VStack(alignment: .leading) {
                                    Text(crewMember.astronaut.name).font(.headline)
                                    Text(crewMember.role).foregroundColor(Color.secondary)
                                }
                                Spacer()
                            }
                            .padding(.horizontal)
                        }.buttonStyle(PlainButtonStyle())
                    }
                    
                    
                    Spacer(minLength: 25)
                }
            }
        }
        .navigationBarTitle(Text(mission.displayName))
    }
}

struct MissionView_Previews: PreviewProvider {
    
    static let missions: [Mission] = Bundle.main.decodeJSON("missions.json")
    static let astronauts: [Astronaut] = Bundle.main.decodeJSON("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts, allMissions: missions)
    }
}
