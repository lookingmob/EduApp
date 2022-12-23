//
//  EndQuizoView.swift
//  Eduapp
//
//  Created by alaa gharbi on 4/12/2022.
//

import SwiftUI

struct EndQuizoView: View {
    @EnvironmentObject var triviaManager: QuizoService
    var body: some View {
        if triviaManager.reachedEnd {
            VStack(spacing: 20) {
                Text("Edu App Quiz")
                    .lilacTitle()

                Text("Congratulations, you completed the quiz! 🥳")
                
                Text("You scored \(triviaManager.score) out of \(triviaManager.length)")
                
                Button {
                    Task.init {
                        await triviaManager.fetchQuiz()
                    }
                } label: {
                    PrimaryButton(text: "Play again")
                }
            }
            .foregroundColor(Color(.black))
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.999999999196, green: 0.99999999824, blue: 0.99999999999999989118))
        } else {
            QuestionUIView()
                .environmentObject(triviaManager)
        }    }
}

struct EndQuizoView_Previews: PreviewProvider {
    static var previews: some View {
        EndQuizoView().environmentObject(QuizoService())
    }
}
