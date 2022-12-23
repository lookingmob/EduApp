//
//  addbookView.swift

import SwiftUI
import AlamofireImage
import Alamofire

struct addbookView: View {
    
    
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
    @State var selectedbook:BookModel?
    init()
    {
        UITextView.appearance().backgroundColor = .clear
    }
    var body: some View {
        VStack{
            VStack{
                PageTitle(title:"ADD CLUB").padding(10)
                VStack(alignment: .leading, spacing:8){
                    ScrollView{
                        
                        VStack(alignment: .leading, spacing: 24){
                            
                            VStack(alignment: .leading, spacing: 8){
                                Text(NSLocalizedString("Add your Book ", comment: "")).setStyle(size:15)
                                
                            }
                            HStack{
                                VStack(alignment: .leading, spacing: 10){         VStack(alignment: .leading, spacing: 10){
                                    //Spacer(minLength: 15)
                                    Text("Book Name")
                                }
                                    
                                    ZStack{
                                        
                                        RoundedRectangle(cornerRadius:15).stroke(Color.black).cornerRadius(15)
                                        ZStack(alignment: .leading){
                                            if bookname.isEmpty {
                                                Text("bookname").padding()
                                            }
                                            TextField("", text: $bookname).padding()
                                        }
                                    }.frame(width:350,height: 35)
                                }
                            }
                            //book
                            HStack{
                                VStack(alignment: .leading, spacing: 10){         VStack(alignment: .leading, spacing: 10){
                                    //Spacer(minLength: 15)
                                    Text("Degre Book")
                                }
                                    
                                    ZStack{
                                        Spacer()
                                        
                                        RoundedRectangle(cornerRadius:15).stroke(Color.black).background(Color.Eduapp_yellowich).cornerRadius(15)
                                        
                                        
                                        VStack{
                                            
                                            if selectedbook == nil{
                                                HStack{
                                                    Text("degre book").padding()
                                                    Spacer()
                                                    if showDropdown{
                                                        //                                            degre("").setStyle(size:15,color:.white.opacity(0.5)).padding()
                                                        
                                                    }else{
                                                        
                                                        Image(systemName: "chevron.down").font(.system(size: 15, weight:.thin)).foregroundColor(.white.opacity(0.5)).padding()
                                                    }
                                                }
                                                
                                            }else{
                                                BookItem(degre: selectedbook?.degre ?? "")
                                            }
                                        }
                                        
                                    }.frame(width:350 , height: 30).onTapGesture {withAnimation (.easeInOut){  self.showDropdown.toggle()}}
                                    
                                    if showDropdown
                                    {
                                        ZStack(alignment: .leading){
                                            bookPickerView(selectedbook: $selectedbook,showDropdown:$showDropdown)
                                        }.overlay{
                                            RoundedRectangle(cornerRadius:15).stroke(Color.white).cornerRadius(15)
                                        }
                                        //.background(Color.ClubNet_LightBlue)
                                    }
                                }
                            }
                            HStack{
                                VStack(alignment: .leading, spacing: 10){
                                    
                                    VStack(alignment: .leading, spacing: 10){
                                        //Spacer(minLength: 15)
                                        Text("Auth Name")
                                    }
                                    ZStack{
                                        RoundedRectangle(cornerRadius:15).stroke(Color.black).cornerRadius(15)
                                        ZStack(alignment: .leading){
                                            
                                            if authorname.isEmpty {
                                                Text("Name").padding()
                                            }
                                            TextField("", text: $authorname )
                                        }
                                    }.frame(width:200,height: 35)
                                    
                                }
                                VStack(alignment: .leading, spacing: 10){
                                    
                                    VStack(alignment: .leading, spacing: 8){
                                        
                                        //       Spacer(minLength: 50)
                                        Text("Edition")
                                    }
                                    ZStack{
                                        RoundedRectangle(cornerRadius:15).stroke(Color.black).cornerRadius(15)
                                        ZStack(alignment: .leading){
                                            
                                            if edition.isEmpty {
                                                Text("ex:2019").padding()
                                            }
                                            TextField("", text: $edition )
                                        }
                                    }.frame(width:140,height: 35)
                                    
                                }
                            }
                            
                            //                            ZStack{
                            //                                RoundedRectangle(cornerRadius:15).stroke(Color.EduApp_LightBlue).cornerRadius(15)
                            //                                ZStack(alignment: .leading){
                            //                                    if showImagePicker.isEmpty {
                            //                                        Text("Description...").setStyle(size:15,color:Color.Eduapp_grayhalfdegree.opacity(0.5)).padding([.leading,.bottom]).padding(4)
                            //                                    }
                            //                                    TextEditor(text: $showImagePicker).padding().frame(height : 90)
                            //                                }
                            //                            }.frame(width:350,height: 80)
                            //
                            //                            VStack{
                            //                                ZStack{
                            //                                    ZStack
                            //                                    {  RoundedRectangle(cornerRadius:20).stroke(Color.black).background(Color.blue.opacity(0.01)).cornerRadius(20)
                            //
                            //                                        HStack{
                            //
                            //                                            if let selectedImage = selectedImage {
                            //
                            //                                                Image(uiImage:selectedImage).resizable().frame(maxWidth:.infinity,maxHeight: .infinity).cornerRadius(15).onTapGesture {
                            //
                            //                                                    self.showImagePicker = true
                            //                                                }
                            //
                            //                                            }else{
                            //                                              Image(systemName: "photo").cornerRadius(20).scaledToFit().font(.system(size: 200, weight:.thin)).foregroundColor(Color.EduApp_DarkBlue).onTapGesture {
                            //                                                    self.showImagePicker = true
                            //                                                }
                            //
                            //                                            }
                            //                                        }
                            //                                    }.onChange(of: self.selectedImage){ newVal in
                            //                                        self.selectedImage = newVal
                            //                                    }.onAppear{
                            //                                        self.selectedImage = nil
                            //                                    }
                            //                                }.frame(width:350,height: 200)
                            //                                if selectedImage != nil {
                            //                                    HStack{
                            //                                        Text("click again to change the image")
                            //                                            .setStyle(color:.EduApp_LightG2).frame(alignment:.leading)
                            //                                        Spacer()
                            //                                    }.frame(width:350)
                            //                                }
                            //                            }
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
                            
                            Button(action: {isPickerPresented.toggle()}, label: {
                                //   Image(systemName: "pdficon").font(.system(size: 15, weight:.thin))
                                Text("PDF")
                            })
                            .frame(width: 150, height: 50)
                            .sheet(isPresented: $isPickerPresented) {
                                DocumentPicker(url: $documentUrl)
                            }
//                            .sheet(item: $documentUrl) { url in
//                               // PDFComponent(url:  url)
//                            }
                            .buttonStyle(.bordered)
                        }
                        //                        HStack{
                        //                            NavigationLink(destination: ContentView, isActive: $formActive ){
                        //                                EmptyView()
                        //                            }
                        //                        }
                      
                        
                        Btnbook(text: "ADD BOOK", namebook: bookname, bookauth:authorname, edition: edition, degree: degre, immgo: selectedImage,urlString: documentUrl)
                            if let url = documentUrl {
                                Text(url.absoluteString)
                        }
                    }
                    
                    
                    
                }.frame(alignment: .leading).padding().sheet(isPresented: $showImagePicker)
                {
                    ImagePicker(sourceType: .photoLibrary, selectedImage: $selectedImage)
                }
            }.applyBackground().ignoresSafeArea()
        }
        
    }
    
    
    
    struct addbookView_Previews: PreviewProvider {
        static var previews: some View {
            addbookView()
        }
    }
}
