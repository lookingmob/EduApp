//
//  QuizView.swift
//  EduApp
//
//  Created by alaa gharbi on 19/11/2022.
//

import SwiftUI

struct QuizView: View {
    var body: some View {
        VStack{
            VStack{
                PageTitle(title:"ADD CLUB").padding(10)
                VStack(alignment: .leading, spacing:8){
                    ScrollView{
                        
                        VStack(alignment: .leading, spacing: 24){
                            
                            VStack(alignment: .leading, spacing: 8){
                                Text("Add your QUIZ ").setStyle(size:15)
                                Text("write your quiz").setStyle(size:14,color:.EduApp_DarkBlue)
                            }
                            RoundedRectangle(cornerRadius: 29)
                                .fill(Color(#colorLiteral(red: 1, green: 0.8813334703445435, blue: 0.25833332538604736, alpha: 1)))
                            .frame(width: 364, height: 71)
                            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius:4, x:0, y:4)
                            RoundedRectangle(cornerRadius: 29)
                                .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                            .frame(width: 364, height: 71)
                            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius:4, x:0, y:4)
                            RoundedRectangle(cornerRadius: 29)
                                .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                            .frame(width: 364, height: 71)
                            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius:4, x:0, y:4)
                            RoundedRectangle(cornerRadius: 29)
                                .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                            .frame(width: 364, height: 71)
                            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius:4, x:0, y:4)
                        }
                    }
                }
           //     BtnStyle(text:"ADD QUIZ ")
            
                
            }
        }.applyBackground().ignoresSafeArea()
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
