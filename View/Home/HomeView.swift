//
//  HomeView.swift
//  ASDTest
//
//  Created by 이완재 on 1/29/24.
//

import SwiftUI

struct HomeView: View {
    @State private var showModal = false
    @State private var hasShownModal = false
    
    let columns: [GridItem] = [
        GridItem(.fixed(200),spacing: 50),
        GridItem(.fixed(200)),
    ]
    
    var body: some View {
        VStack {
            
            
            Image("logo")
                .resizable()
                .frame(width: 200, height: 200)
                .padding(.bottom, 50)
            
            ChartView()
            
            Spacer()
            // MARK: - 그리드
            HStack {
                Spacer()
                NavigationStack {
                    LazyVGrid(columns: columns, spacing: 50) {
                        ForEach(SceneType.allCases, id: \.self) { scene in
                            NavigationLink(destination: SceneViewBuilder.destinationView(scene: scene)) {
                                Text(scene.rawValue)
                                    .frame(width: 200, height: 100)
                                    .background(Color.main)
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .bold))
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
                Spacer()
                
            }
            Spacer()
        }
        .toolbar(.hidden)
        
        // MARK: - 온보딩 시트
        .sheet(isPresented: $showModal, content: {
            TabView {
                OnBoardingDescriptionView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.bottom, 50)
                OnBoardingEndView(showModal: $showModal)
            }
            .tabViewStyle(.page)
        })
        .onAppear {
            if !hasShownModal {
                showModal = true
                hasShownModal = true
            }
        }
    }
}

#Preview {
    HomeView()
}
