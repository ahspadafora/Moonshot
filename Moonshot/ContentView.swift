//
//  ContentView.swift
//  Moonshot
//
//  Created by Amber Spadafora on 10/27/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts: [Astronaut] = Bundle.main.decodeJSON("astronauts.json")
    let missions: [Mission] = Bundle.main.decodeJSON("missions.json")
    
    // if isShowingLaunchDates is false, then crew names will be listed instead
    @State private var isShowingLaunchDates = false
    
    
    var body: some View {
        
        NavigationView {
            VStack {
                Toggle(isOn: $isShowingLaunchDates) {
                    Text("Show Launch Dates")
                }.padding()
                
                List(missions) { mission in
                    NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts, allMissions: self.missions)) {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 44, height: 44)
                        VStack(alignment: .leading) {
                            Text(mission.displayName).font(.headline)
                            if self.isShowingLaunchDates {
                                Text(mission.formattedLaunchDate)
                            } else {
                                Text("Crew: \(mission.crewString)")
                            }
                            
                        }
                    }
                }
                .navigationBarTitle("Moonshot")
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
