//
//  TestResultView.swift
//
//
//  Created by 이완재 on 1/30/24.
//

import SwiftUI

struct TestResultView: View {
    @EnvironmentObject var questionViewModel: QuestionViewModel
    @StateObject private var testResultViewModel = TestResultViewModel()
    @State var navigateToNext = false
    @State var showingModal = false

    var body: some View {
        ScrollView {
            VStack {
                ChartView()
                    .frame(height: 600)

                Divider()
                
                HStack {
                    Text("Summary")
                        .font(.title3)
                        .padding(.vertical, 30)
                    
                    
                }

                Text(testResultViewModel.summaryResult())
                    .padding(.bottom, 30)
                
                Button(action: {
                    showingModal = true
                }) {
                    Text("What is the severity criteria?")
                        .underline()
                        .italic()
                        .foregroundColor(Color.main)

                }
                .fullScreenCover(isPresented: $showingModal, content: {
                    SeverityView(showingModal: $showingModal)
                })
                .buttonStyle(.borderless)

                Spacer()
                   
                Divider()
                
                Text("The items you responded 'yes' to: \(testResultViewModel.socialTestResults.count)")
                    .font(.title3)
                    .padding(.vertical, 50)
                
                ForEach(testResultViewModel.socialTestResults, id: \.self) { result in
                    HStack {
                        Text("\(result.description)")
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 50)
                            .padding(.bottom, 30)
                        Spacer()
                    }
                }
                
                Divider()
                
                Text("The items you responded 'yes' to: \(testResultViewModel.behaviorTestResults.count)")
                    .font(.title3)
                    .padding(.vertical, 50)

                ForEach(testResultViewModel.behaviorTestResults, id: \.self) { result in
                    HStack {
                        Text("\(result.description)")
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 50)
                            .padding(.bottom, 30)
                        Spacer()
                    }
                }
               
                
                Spacer()
                
                NavigationLink(destination: HomeView(), isActive: $navigateToNext) {
                    AnswerButton(title: "Go To Home") {
                        navigateToNext = true
                    }
                }
            }
            .onAppear {
                testResultViewModel.loadResultsFromUserDefaults()
                testResultViewModel.getUserAnswer(viewModel: questionViewModel)
            }
        }
    }
}

#Preview {
    TestResultView()
        .environmentObject(QuestionViewModel())
}
