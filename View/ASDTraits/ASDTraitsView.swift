//
//  ASDTraits.swift
//
//
//  Created by 이완재 on 1/30/24.
//

import SwiftUI

struct ASDTraits: View {
    @State var selectedTab = 0
    
    var body: some View {
        Text("ASD Traits")
            .font(.largeTitle)
            .bold()
        
        Picker("Traits", selection: $selectedTab) {
            Text("Communication")
                .padding()
                .tag(0)
            
            Text("Behavior")
                .padding()
                .tag(1)
            
            Text("Interaction")
                .padding()
                .tag(2)
        }
        .pickerStyle(.segmented)
        
        if selectedTab == 0 {
            CommunicationView()
        } else if selectedTab == 1 {
            BehaviorView()
        } else {
            InteractionView()
        }
        
        Spacer()
    }
}

#Preview {
    ASDTraits()
}
