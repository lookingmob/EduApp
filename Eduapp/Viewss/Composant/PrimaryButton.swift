//
//  PrimaryButton.swift
//  Eduapp
//
//  Created by alaa gharbi on 4/12/2022.
//

import SwiftUI

struct PrimaryButton: View {
    var text: String
    var background: Color = Color("AccentColor")
    
    var body: some View {
        Text(text)
        .foregroundColor (.black)
        .padding ()
        .padding (.horizontal)
        .background (background)
        .cornerRadius (30)
        .shadow (radius: 10)
        
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text: "Next")
    }
}
