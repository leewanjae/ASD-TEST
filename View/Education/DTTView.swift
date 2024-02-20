//
//  DTTView.swift
//
//
//  Created by 이완재 on 2/20/24.
//

import SwiftUI

struct DTTView: View {
    var viewModel = EducationViewModel()
    var body: some View {
        VStack {
            Divider()
                .background(Color.main)
                .padding()
            Text("Discrete Trial Teaching(DTT)")
                .font(.largeTitle)
                .bold()
            Divider()
                .background(Color.main)
                .padding()
            
            Text(viewModel.dtt)
        }
        .padding()
    }
}

#Preview {
    DTTView()
}
