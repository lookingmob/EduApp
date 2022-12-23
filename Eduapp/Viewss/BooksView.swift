//
//  BooksView.swift
//  EduApp
//
//  Created by islem on 18/11/2022.
//

import SwiftUI
import CoreData
import UIKit
import Alamofire

struct BooksView: View {
    
    @State private var bookname: String = ""
    @State private var authorname: String = ""
    @State private var degre: String = ""
    @State private var edition: String = ""
    @State private var image: String = ""
    @State var selectedImage: UIImage?
    @State var showImagePicker : Bool = false
    @State var showDropdown:Bool = false
    @State private var isPickerPresented = false
    @State private var documentUrl: URL?
    //    init()
    var body: some View {
        VStack{
            VStack{
                // Title(title:"ADD book").padding(4)
                VStack(alignment: .leading, spacing:8){
                    ScrollView{
                        
                        VStack(alignment: .leading, spacing: 24){
                            
                            VStack(alignment: .leading, spacing: 8){
                                
                                Spacer(minLength: 50)
                                Text("Book Name")
                            }
                            ZStack{
                                Color.white.ignoresSafeArea()
                                ZStack(alignment: .leading){
                                    
                                    if bookname.isEmpty {
                                        Text("Name").padding()
                                    }
                                    TextField("", text: $bookname ).extensionTextFieldView(roundedCornes: 20, startColor: .yellow)
                                }
                            }.frame(width:350,height: 35)
                            
                        }
                        HStack{
                            VStack(alignment: .leading, spacing: 24){
                                
                                VStack(alignment: .leading, spacing: 8){
                                    
                                    Spacer(minLength: 50)
                                    Text("Auth Name")
                                }
                                ZStack{
                                    Color.white.ignoresSafeArea()
                                    ZStack(alignment: .leading){
                                        
                                        if authorname.isEmpty {
                                            Text("Name").padding()
                                        }
                                        TextField("", text: $authorname ).extensionTextFieldView(roundedCornes: 20, startColor: .yellow)
                                    }
                                }.frame(width:200,height: 35)
                                
                            }
                            VStack(alignment: .leading, spacing: 24){
                                
                                VStack(alignment: .leading, spacing: 8){
                                    
                                    Spacer(minLength: 50)
                                    Text("Edition")
                                }
                                ZStack{
                                    Color.white.ignoresSafeArea()
                                    ZStack(alignment: .leading){
                                        
                                        if edition.isEmpty {
                                            Text("Name").padding()
                                        }
                                        TextField("", text: $edition ).extensionTextFieldView(roundedCornes: 20, startColor: .yellow)
                                    }
                                }.frame(width:140,height: 35)
                                
                            }
                        }
                         //
                        VStack(alignment: .leading, spacing: 24){
                            
                            VStack(alignment: .leading, spacing: 8){
                                
                                Spacer(minLength: 50)
                                Text("Select your class or degree")
                            }
                            ZStack{
                                Color.white.ignoresSafeArea()
                                ZStack(alignment: .leading){
                                    
                                    if degre.isEmpty {
                                        Text("Name").padding()
                                    }
                                    TextField("", text: $degre ).extensionTextFieldView(roundedCornes: 20, startColor: .yellow)
                                }
                            }.frame(width:350,height: 35)
                            
                        }
                        VStack{

                            ZStack{
                                ZStack{RoundedRectangle(cornerRadius:8).cornerRadius(8).foregroundColor(.white)
                                    
                                    HStack{
                                        
                                        if let selectedImage = selectedImage {
                                            
                                            Image(uiImage:selectedImage).resizable().frame(maxWidth:.infinity,maxHeight: .infinity).cornerRadius(15).onTapGesture {
                                                
                                                self.showImagePicker = true
                                            }
                                            
                                        }else{
                                          Image(systemName: "photo").cornerRadius(10).scaledToFit().font(.system(size:100, weight:.thin)).onTapGesture {
                                                self.showImagePicker = true
                                            }
                                            
                                        }
                                    }
                                }.onChange(of: self.selectedImage)
                                { newVal in
                                    self.selectedImage = newVal
                                }.onAppear
                                {
                                    self.selectedImage = nil
                                }
                            }.frame(width:350,height: 200)
                            if selectedImage != nil {
                                HStack{
                                    Text("click again to change the cover").frame(alignment:.leading)
                                    Spacer()
                                }.frame(width:350)
                            }
                        }
                        HStack{
                            Button("Add") {
                                 AF.request("http://172.17.2.159:3000/book/addbook",method: .post,parameters: ["bookname": bookname,"authname" : authorname,"edition":edition,"degre" : degre],encoding: JSONEncoding.default)
                                         .validate()
                                         .responseJSON{ (data) in
                                             print(data)
                                         }                            }
                            if let url = documentUrl {
                                Text(url.absoluteString)
                            }
                            
                            Button(action: {isPickerPresented.toggle()}, label: {
                                Text("PDF")
                            })
                            .frame(width: 150, height: 50)
                            .sheet(isPresented: $isPickerPresented) {
                                DocumentPicker(url: $documentUrl)
                            }
                            .sheet(item: $documentUrl) { url in
                PDFComponent(url:  url)            }                        }
                        .buttonStyle(.bordered)
                    }
                }
            }
        }.frame(alignment: .leading).padding().sheet(isPresented: $showImagePicker)
        {
            
            ImagePicker(sourceType: .photoLibrary, selectedImage: $selectedImage)
            
        }

}
                    
}
                
                

struct BooksView_Previews: PreviewProvider {
    static var previews: some View {
        BooksView()
    }
}
extension Color{
    static let darkPink = Color(red: 208, green: 45, blue: 208)
}
extension TextField{
    func extensionTextFieldView(roundedCornes: CGFloat ,startColor: Color) -> some View {
        self
            .padding()
          
            .background(LinearGradient(gradient: Gradient(colors: [startColor,startColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(roundedCornes)
            .shadow(color: .yellow, radius: 10)
    }
}

extension URL: Identifiable{
   public var id: String {
       return self.absoluteString
   }
}
