//
//  TestContentsView.swift
//
//
//  Created by 이완재 on 2/2/24.
//

import SwiftUI

struct TestContentsView: View {
    @ObservedObject var viewModel: StartTestViewModel
    
    var body: some View {
        NavigationStack {
            Text(viewModel.userInfo.name)
            Text("\(viewModel.userInfo.age)")
            
        }
        
    }
}

struct TestContentsView_Previews: PreviewProvider {
    static var previews: some View {
        // 프리뷰를 위한 임시 StartTestViewModel 인스턴스 생성
        let tempViewModel = StartTestViewModel()

        // 프리뷰에 사용될 TestContentsView 생성, tempViewModel을 전달
        TestContentsView(viewModel: tempViewModel)
    }
}
