//
//  CommunicationView.swift
//
//
//  Created by 이완재 on 2/20/24.
//

import SwiftUI

struct CommunicationView: View {
    let viewModel = TraitsViewModel()
    
    var body: some View {
        VStack {
            Divider()
                .background(Color.main)
                .padding()
            Text("Communication")
                .font(.largeTitle)
                .bold()
            Divider()
                .background(Color.main)
                .padding()
            
            Text("Common")
                .font(.title2)
                .bold()
            Text(viewModel.communication)
            Divider()
                .padding()
            Text("Echolalia")
                .font(.title2)
                .bold()
            Text(viewModel.echolalia)
        }
        .padding()
    }
}

#Preview {
    CommunicationView()
}
