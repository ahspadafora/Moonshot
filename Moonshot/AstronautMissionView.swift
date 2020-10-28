//
//  AstronautMissionView.swift
//  Moonshot
//
//  Created by Amber Spadafora on 10/28/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import SwiftUI

struct AstronautMissionView: View {
    
    init(missions: [Mission]) {
        self.missions = missions
    }
    let missions: [Mission]
    
    var body: some View {
        GeometryReader { geometry in
            
            ScrollView(.vertical) {
                Text("Missions").font(.largeTitle)
                ForEach(self.missions, id: \.id) { mission in
                    VStack(alignment: .center) {
                        Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.75)
                        .padding(.top)
                        Text(mission.displayName)
                    }
                }
            }.frame(width: geometry.size.width)
        }
        
    }
}

struct AstronautMissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decodeJSON("missions.json")
    static var previews: some View {
        AstronautMissionView(missions: missions)
    }
}
