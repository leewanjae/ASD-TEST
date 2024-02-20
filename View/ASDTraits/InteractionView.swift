//
//  InteractionView.swift
//
//
//  Created by 이완재 on 2/20/24.
//

import SwiftUI

struct InteractionView: View {
    let viewModel = TraitsViewModel()
    
    var body: some View {
        VStack {
            Divider()
                .background(Color.main)
                .padding()
            Text("Interaction")
                .font(.largeTitle)
                .bold()
            Divider()
                .background(Color.main)
                .padding()
            
            Text("Common")
                .font(.title2)
                .bold()
            Text(viewModel.interaction)
            Divider()
            
            Text("Theory of mind")
                .font(.title2)
                .bold()
            Text(viewModel.tom)
            Divider()
        }
        .padding()
    }
}

#Preview {
    InteractionView()
}
