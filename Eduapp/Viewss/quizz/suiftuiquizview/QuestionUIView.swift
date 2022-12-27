//
//  QuestionUIView.swift
//  Eduapp
//
//  Created by alaa gharbi on 4/12/2022.
//

import SwiftUI

struct QuestionUIView: View {
    @EnvironmentObject var quizoService: QuizoService

    var body: some View {
        VStack(spacing: 40) {
            HStack {
                Text("Edu App Quiz")
                    .lilacTitle()
                
                Spacer()
                
                Text("\(quizoService.index + 1) "+NSLocalizedString("out of", comment: "")+" \(quizoService.length)")
                    .foregroundColor(Color("EduApSeconRed"))
                    .fontWeight(.heavy)
            }
            
            ProgressBar(progress: quizoService.progress)
            
            VStack(alignment: .leading, spacing: 20) {
                Text(quizoService.question)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.gray)
                
                ForEach(quizoService.answerChoices, id: \.id) { answer in
                    AnswerRow(answer: answer)
                        .environmentObject(quizoService)
                }
            }
            
            Button {
                quizoService.goToNextQuestion()
            } label: {
                PrimaryButton(text: NSLocalizedString("Next", comment: ""), background: quizoService.answerSelected ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
            }
            .disabled(!quizoService.answerSelected)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
       // .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        .navigationBarHidden(true)
    }
}

struct QuestionUIView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionUIView()
    }
}
