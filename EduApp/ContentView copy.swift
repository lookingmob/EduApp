//
//  ContentView.swift
//  EduApp
//
//  Created by alaa gharbi on 9/11/2022.
//

import SwiftUI
import UIKit
import CoreData

struct ContentView: View {

    var body: some View {

        storyboardview().edgesIgnoringSafeArea(.all)
    }
}
struct storyboardview: UIViewControllerRepresentable{
    func makeUIViewController(context: Context) -> some UIViewController {
        let storyboard = UIStoryboard(name: "Storyboard", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(identifier: "Welcome")
    return controller
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
}
private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
 
