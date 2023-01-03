//
//  QuizIntroSwiftUIView.swift
//  Eduapp
//
//  Created by alaa gharbi on 4/12/2022.
//

import SwiftUI

struct QuizIntroSwiftUIView: View {
    @StateObject var triviaManager = QuizoService()
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                VStack(spacing: 20) {
                    Text("EduApp Quiz")
                        .lilacTitle()
                    
                    Text(NSLocalizedString("Are you ready to test out your trivia skills?", comment: ""))
                        .foregroundColor(Color(.systemGray))
                }
                
                NavigationLink {
                    EndQuizoView()
                        .environmentObject(triviaManager)
                }
            label: {
                    PrimaryButton(text: NSLocalizedString("Let's go!", comment: ""))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        }
    }
}


struct QuizIntroSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        QuizIntroSwiftUIView()
    }
}
