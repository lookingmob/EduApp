////
////  documentDirectory.swift
////  Eduapp
////
////  Created by alaa gharbi on 10/12/2022.
////
//
//import SwiftUI
//import VisionKit
//import PDFKit
//import UIKit
//func getDocumentsDirectory() -> [String] {
//do {
//var a : [String] = []
//let fm = FileManager.default
//// setting file manager's url to document
//let path =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].path
//let items = try fm.contentsOfDirectory(atPath: path)
//// adding all the file names to the array
//for item in items {
//print("Found \(item)")
//a.append(item.description)
//}
//// returns the array
//return a
//} catch {
//// if directory is not read, it returns a empty array
//let a : [String] = []
//return a
//}
//    LazyVGrid(columns: [GridItem(.adaptive(minimum: UIScreen.main.bounds.width/4))], spacing: 20){
//    ForEach( files.indices, id: \.self){ file in
//    VStack{
//    //the image I used is the icon of google docs
//    Image(“docs”).resizable().aspectRatio(contentMode: .fit)
//    Spacer()
//    Text(“\(files[file])”).font(.caption)
//    }
//    }.padding().frame(width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.width/3).background(Color.gray)
//    }
//    VStack{
//    Spacer()
//    //new Document Button, will send us to Another View to scan the document
//    NavigationLink(destination: scanView(files: $files, viewModel: viewModel)){
//    VStack{
//    Image(systemName: “plus”).font(.largeTitle).padding(.bottom)
//    Text(“Scan New Document”).font(.caption)
//    }
//    }
//    Spacer()
//    }.padding().frame(width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.width/3).background(Color.gray).padding(.horizontal)
//    }.padding()
//
//
//}
