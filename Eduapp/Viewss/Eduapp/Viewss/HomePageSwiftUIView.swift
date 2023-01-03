//
//  HomePageSwiftUIView.swift
//  Eduapp
//
//  Created by alaa gharbi on 5/12/2022.
//hedhy zeyda

import SwiftUI

struct HomePageSwiftUIView: View {
    var body: some View {
        VStack{
            HStack(spacing: 20) {
                Image(systemName: "circle.fill")
                    .font(.caption)
                
                Text("answer.text")
                    .bold()
                
//                if isSelected {
//                    Spacer()
//
//                    Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
//                        .foregroundColor(answer.isCorrect ? green : red)
//                }
            }
            .padding()
            .frame(maxWidth: .infinity,
                    maxHeight: 120 ,
                    alignment: .leading)
            .foregroundColor( Color(.black))
            .background(.white)
            .cornerRadius(10)
            .shadow(color: .gray, radius: 5, x: 0.5, y: 0.5)
            .onTapGesture {
            }
            HStack(spacing: 20) {
                Image(systemName: "circle.fill")
                    .font(.caption)
                
                Text("answer.text")
                    .bold()
                
//                if isSelected {
//                    Spacer()
//
//                    Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
//                        .foregroundColor(answer.isCorrect ? green : red)
//                }
            }
            .padding()
            .frame(maxWidth: .infinity,
                    maxHeight: 120 ,
                    alignment: .leading)
            .foregroundColor( Color(.black))
            .background(.white)
            .cornerRadius(10)
            .shadow(color: .gray, radius: 5, x: 0.5, y: 0.5)
            .onTapGesture {
            }
            HStack(spacing: 20) {
                Image(systemName: "circle.fill")
                    .font(.caption)
                
                Text("answer.text")
                    .bold()
                
//                if isSelected {
//                    Spacer()
//
//                    Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
//                        .foregroundColor(answer.isCorrect ? green : red)
//                }
            }
            .padding()
            .frame(maxWidth: .infinity,
                    maxHeight: 120 ,
                    alignment: .leading)
            .foregroundColor( Color(.black))
            .background(.white)
            .cornerRadius(10)
            .shadow(color: .gray, radius: 5, x: 0.5, y: 0.5)
            .onTapGesture {
            }
        }
    }
}

struct HomePageSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageSwiftUIView()
    }
}
