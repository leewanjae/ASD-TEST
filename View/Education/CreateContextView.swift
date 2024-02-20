//
//  CreateContextView.swift
//
//
//  Created by 이완재 on 2/20/24.
//

import SwiftUI

struct CreateContextView: View {
    var viewModel = EducationViewModel()
    var body: some View {
        VStack {
            Divider()
                .background(Color.main)
                .padding()
            Text("Creating Context for Teaching")
                .font(.largeTitle)
                .bold()
            Divider()
                .background(Color.main)
                .padding()

            Text("Structuring the Physical Environment")
                .font(.headline)
                .bold()
                .padding()
            Text(viewModel.context1)
            
            Text("Establishing a Temporal Structure")
                .font(.headline)
                .bold()
                .padding()
            Text(viewModel.context2)
            
            Text("Pre-exposure to Information")
                .font(.headline)
                .bold()
                .padding()
            Text(viewModel.context3)
            
        }
        .padding()
    }
}

#Preview {
    CreateContextView()
}
