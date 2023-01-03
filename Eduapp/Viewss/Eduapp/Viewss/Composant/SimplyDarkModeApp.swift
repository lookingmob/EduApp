//
//  SimplyDarkModeApp.swift
//  Eduapp
//
//  Created by alaa gharbi on 2/1/2023.
//

import SwiftUI

struct SimplyDarkModeApp: View {

    @State private var showingSettinghView: Bool = false
    @State private var isDarkMode = true
    var body: some View {
        VStack{
            Button(action: {
                isDarkMode.toggle()
                if isDarkMode == true{
                    let window = UIApplication.shared.windows[0]
                    window.overrideUserInterfaceStyle = .light
                }
                else{
                    let window = UIApplication.shared.windows[0]
                    window.overrideUserInterfaceStyle = .dark
                }
            },label: {
                Image(systemName: isDarkMode ? "moon.circle.fill" :
                           "moon.circle")
               
            .imageScale(.large)
            })
            .padding()
            //Mark: button to display settingsiew
//            Button(action: {
//                self.showingSettinghView.toggle()
//                }) {
//                    Image(systemName: "gear.circle").imageScale(.large)
//                }
//                .sheet(isPresented: $showingSettinghView){
//                   // SettingsView()
//                }
    }
                   }}

struct SimplyDarkModeApp_Previews: PreviewProvider {
    static var previews: some View {
        SimplyDarkModeApp()
    }
}
