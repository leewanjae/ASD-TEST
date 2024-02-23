//
//  PRTView.swift
//
//
//  Created by 이완재 on 2/20/24.
//

import SwiftUI

struct PRTView: View {
    var viewModel = EducationViewModel()
    
    var body: some View {
        VStack {
            Divider()
                .background(Color.main)
                .padding()
            Text("Pivotal Response Training(PRT)")
                .font(.largeTitle)
                .bold()
            Divider()
                .background(Color.main)
                .padding()

            Text(viewModel.prt)
        }
        .padding()
    }
}

#Preview {
    PRTView()
}
