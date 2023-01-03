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
                Text(NSLocalizedString("Edu App Quiz", comment: ""))
                    .lilacTitle()

                Text(NSLocalizedString("Congratulations, you completed the quiz! 🥳", comment: ""))
                
                Text(NSLocalizedString("You scored", comment: "")+" \(triviaManager.score) "+NSLocalizedString("out of", comment: "")+" \(triviaManager.length)")
                
                Button {
                    Task.init {
                        await triviaManager.fetchQuiz()
                    }
                } label: {
                    PrimaryButton(text: NSLocalizedString("Play again", comment: ""))
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
