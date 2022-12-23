//
//  MainviewSwiftUI.swift
//  Eduapp
//
//  Created by alaa gharbi on 26/11/2022.
//

import SwiftUI

struct MainviewSwiftUI: View {
    var body: some View {
        ZStack {
            Rectangle()
            .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))

            Rectangle()
            .strokeBorder(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), lineWidth: 1)
            //diffferent levels and languages
            Text("diffferent levels and languages").font(.custom("Inter Medium", size: 13)).foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5))).multilineTextAlignment(.center)
            //Available in iOS 14 only
            .textCase(.lowercase)
        }
        .compositingGroup()
        .frame(width: 390, height: 844)
        .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius:4, x:0, y:4)
    }
}

struct MainviewSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        MainviewSwiftUI()
    }
}
