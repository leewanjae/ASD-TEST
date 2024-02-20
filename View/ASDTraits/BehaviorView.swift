//
//  BehaviorView.swift
//
//
//  Created by 이완재 on 2/20/24.
//

import SwiftUI

struct BehaviorView: View {
    let viewModel = TraitsViewModel()
    var body: some View {
        VStack {
            Divider()
                .background(Color.main)
                .padding()
            Text("Behavior")
                .font(.largeTitle)
                .bold()
            Divider()
                .background(Color.main)
                .padding()
            
            Text("Common")
                .font(.title2)
                .bold()
            Text(viewModel.behavior)
            Divider()
            
            Text("Stereotypy")
                .font(.title2)
                .bold()
            Text(viewModel.stereotypy)
        }
        .padding()
    }
}

#Preview {
    BehaviorView()
}
