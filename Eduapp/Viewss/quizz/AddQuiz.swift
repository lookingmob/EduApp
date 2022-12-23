//
//  AddQuiz.swift
//  EduApp
//
//  Created by alaa gharbi on 16/11/2022.
//

import SwiftUI
import AlamofireImage
import Alamofire

struct AddQuiz: View {
    @State private var name: String = ""
    @State private var description: String = ""
    @State private var image: String = ""
    @State private var reponsecorrectt = ""
    @State private var reponse1 = ""
    @State private var reponse2 = ""
    @State private var reponse3 = ""
    @State private var quizgroup = ""


    @State var selectedImage: UIImage?
    @State var showImagePicker : Bool = false
    
  //  @State var selectedUniversity:UniversityModel?
    @State var showDropdown:Bool = false
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
                                Text("Add your QUIZ ").setStyle(size:15)
                                Text("write your quiz").setStyle(size:14,color:.EduApp_DarkBlue)
                            }
                            ZStack{
                                RoundedRectangle(cornerRadius:15).stroke(Color.black).cornerRadius(15)
                                ZStack(alignment: .leading){
                                    if name.isEmpty {
                                        Text("question").padding()
                                    }
                                    TextField("", text: $name ).padding()
                                }
                            }.frame(width:350,height: 35)
                            
                            ZStack{
                                RoundedRectangle(cornerRadius:15).stroke(Color.black).cornerRadius(15)
                                ZStack(alignment: .leading){
                                    if quizgroup.isEmpty {
                                        Text("group").padding()
                                    }
                                    TextField("", text: $quizgroup ).padding()
                                }
                            }.frame(width:350,height: 35)
                            
                            ZStack{
                                RoundedRectangle(cornerRadius:15).stroke(Color.black).cornerRadius(15)
                                ZStack(alignment: .leading){
                                    if reponsecorrectt.isEmpty {
                                        Text("reponse correct").padding()
                                    }
                                    TextField("", text: $reponsecorrectt ).padding()
                                }
                            }.frame(width:350,height: 35)
                            
                            ZStack{
                                RoundedRectangle(cornerRadius:15).stroke(Color.black).cornerRadius(15)
                                ZStack(alignment: .leading){
                                    if reponse1.isEmpty {
                                        Text("reponse 1").padding()
                                    }
                                    TextField("", text: $reponse1 ).padding()
                                }
                            }.frame(width:350,height: 35)
                            
                            ZStack{
                                RoundedRectangle(cornerRadius:15).stroke(Color.black).cornerRadius(15)
                                ZStack(alignment: .leading){
                                    if reponse2.isEmpty {
                                        Text("reponse2").padding()
                                    }
                                    TextField("", text: $reponse2 ).padding()
                                }
                            }.frame(width:350,height: 35)
                            
                            ZStack{
                                RoundedRectangle(cornerRadius:15).stroke(Color.black).cornerRadius(15)
                                ZStack(alignment: .leading){
                                    if reponse3.isEmpty {
                                        Text("reponse3").padding()
                                    }
                                    TextField("", text: $reponse3 ).padding()
                                }
                            }.frame(width:350,height: 35)
                            
                            Spacer()
                            
                            ZStack{
                                RoundedRectangle(cornerRadius:15).stroke(Color.EduApp_LightBlue).cornerRadius(15)
                                ZStack(alignment: .leading){
                                    if description.isEmpty {
                                        Text("Description...").setStyle(size:15,color:Color.Eduapp_grayhalfdegree.opacity(0.5)).padding([.leading,.bottom]).padding(4)
                                    }
                                    TextEditor(text: $description).padding().frame(height : 90)
                                }
                            }.frame(width:350,height: 80)
                            
                            VStack{
                                ZStack{
                                    ZStack
                                    {  RoundedRectangle(cornerRadius:20).stroke(Color.black).background(Color.blue.opacity(0.01)).cornerRadius(20)
                                        
                                        HStack{
                                            
                                            if let selectedImage = selectedImage {
                                                
                                                Image(uiImage:selectedImage).resizable().frame(maxWidth:.infinity,maxHeight: .infinity).cornerRadius(15).onTapGesture {
                                                    
                                                    self.showImagePicker = true
                                                }
                                                
                                            }else{
                                              Image(systemName: "photo").cornerRadius(20).scaledToFit().font(.system(size: 200, weight:.thin)).foregroundColor(Color.EduApp_DarkBlue).onTapGesture {
                                                    self.showImagePicker = true
                                                }
                                                
                                            }
                                        }
                                    }.onChange(of: self.selectedImage){ newVal in
                                        self.selectedImage = newVal
                                    }.onAppear{
                                        self.selectedImage = nil
                                    }
                                }.frame(width:350,height: 200)
                                if selectedImage != nil {
                                    HStack{
                                        Text("click again to change the image")
                                            .setStyle(color:.EduApp_LightG2).frame(alignment:.leading)
                                        Spacer()
                                    }.frame(width:350)
                                }
                            }
                        }
                    }
                }
                BtnStyle(category: quizgroup , correctanswer : reponsecorrectt,
                    incorrectanswer1 : reponse2,
                         incorrectanswer2 : reponse2
                         ,incorrectanswer3 : reponse3
                        ,question : name,
                         difeculty : description, text: "ADD QUIZ", immg: selectedImage)
            
                
            }.frame(alignment: .leading).padding().sheet(isPresented: $showImagePicker)
            {
                ImagePicker(sourceType: .photoLibrary, selectedImage: $selectedImage)
            }
        }.applyBackground().ignoresSafeArea()
    }
    
}


struct AddQuiz_Previews: PreviewProvider {
    static var previews: some View {
        AddQuiz()
    }
}
