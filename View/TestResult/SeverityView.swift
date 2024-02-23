//
//  SeverityView.swift
//
//
//  Created by 이완재 on 2/17/24.
//

import SwiftUI

struct SeverityView: View {
    let level1Social = """
    Without supports in place, deficits in social communication cause noticeable impairments.
    
    Difficulty initiating social interactions, and clear examples of atypical or unsuccessful responses to social overtures from others. May appear to have decreased interest in social interactions.
    
    For example, a person who is able to speak in full sentences and engages in communication but whose to-and-fro conversation with others fails, and whose attempts to make friends are odd and typically unsuccessful.
    """
    
    let level1Behavior = """
    Inflexibility of behavior causes significant interference with functioning in one or more contexts.
    
    Difficulty switching between activities. Problems of organization and planning hamper independence.
    """
    
    let level2Social = """
    Marked deficits in verbal and nonverbal social communication skills; social impairments apparent even with supports in place; limited initiation of social interactions; and reduced or abnormal responses to social overtures from others.
    
    For example, a person who speaks simple sentences, whose interaction is limited to narrow special interests, and who has markedly odd nonverbal communication.
    """
    
    let level2Behavior = """
    Inflexibility of behavior, difficulty coping with change, or other restricted/repetitive behaviors appear frequently enough to be obvious to the casual observer and interfere with functioning in a variety of contexts.
    
    Distress and/or difficulty changing focus or action.
    """
    
    let level3Social = """
    Severe deficits in verbal and nonverbal social communication skills cause severe impairments in functioning, very limited initiation of social interactions, and minimal response to social overtures from others.
    
    For example, a person with few words of intelligible speech who rarely initiates interaction and, when he or she does, makes unusual approaches to meet needs only and responds to only very direct social approaches.
    """
    
    let level3Behavior = """
    Inflexibility of behavior, extreme difficulty coping with change, or other restricted/repetitive behaviors markedly interfere with functioning in all spheres.
    
    Great distress/difficulty changing focus or action.
    """
    
    
    var body: some View {
        VStack {
            // MARK: - 심각도 1
            Divider()
                .background(Color.main)
                .padding()
            HStack(alignment: .firstTextBaseline) {
                Text("Severity Level 1")
                    .font(.largeTitle)
                    .bold()
                Text(": Requiring Support")
                    .font(.title)
            }
            Divider()
                .background(Color.main)
                .padding()
            
            Text("Social communication")
                .font(.title2)
            
            Text(level1Social)
                .padding(30)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("Restricted, repetitive behaviors")
                .font(.title2)
            Text(level1Behavior)
                .padding(30)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            // MARK: - 심각도 2
            Divider()
                .background(Color.main)
                .padding()
            HStack(alignment: .firstTextBaseline) {
                Text("Severity Level 2")
                    .font(.largeTitle)
                    .bold()
                Text(": Requiring Substantial Support")
                    .font(.title)
            }
            Divider()
                .background(Color.main)
                .padding()
            
            Text("Social communication")
                .font(.title2)
            Text(level2Social)
                .padding(30)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("Restricted, repetitive behaviors")
                .font(.title2)
            Text(level2Behavior)
                .padding(30)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            // MARK: - 심각도 3
            Divider()
                .background(Color.main)
                .padding()
            HStack(alignment: .firstTextBaseline) {
                Text("Severity Level 3")
                    .font(.largeTitle)
                    .bold()
                Text(": Requiring Very Substantial Support")
                    .font(.title)
            }
            Divider()
                .background(Color.main)
                .padding()
            
            Text("Social communication")
                .font(.title2)
            Text(level3Social)
                .padding(30)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("Restricted, repetitive behaviors")
                .font(.title2)
            Text(level3Behavior)
                .padding(30)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
#Preview {
    SeverityView()
}
