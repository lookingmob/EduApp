//
//  StylePageView.swift
//  EduApp
//
//  Created by alaa gharbi on 18/11/2022.
//

import Foundation
import SwiftUI
import Alamofire
struct PageTitle: View{
        @Environment(\.presentationMode) var mode: Binding<PresentationMode>
        
  //       var link: String
        var title: String
        
        var body: some View {
            
            HStack{
                Image(systemName: "chevron.backward").font(.system(size: 30, weight:.medium)).foregroundColor(.black).background(.clear).onTapGesture {
                    
                    self.mode.wrappedValue.dismiss()
                }
                Spacer()
                Text(title).setStyle(font: .SFPBold, size: 14,color: .Eduapp_red_magenta)
                Spacer()
            }.padding(.horizontal,8)
            
        }
    }
struct BtnStyle : View {
    var category : String
    var correctanswer : String
    var incorrectanswer1 : String
    var incorrectanswer2 : String
    var incorrectanswer3 : String
    var question : String
    var difeculty : String
    var text : String
    var immg : UIImage?
    
    var body: some View {
        Button{
            guard let imageData = immg!.jpegData(compressionQuality: 0.75) else { return }
            let params = ["category": category,"correctanswer" : correctanswer,"incorrectanswer1":incorrectanswer1,"incorrectanswer2":incorrectanswer2 ,"incorrectanswer3":incorrectanswer3,"question":question,"difficulity" : difeculty]
            print(params)
            AF.upload(multipartFormData: { multiPart in
                for (key,keyValue) in params{
                            if let keyData = keyValue.data(using: .utf8){
                                multiPart.append(keyData, withName: key)
                            }
                        }
                multiPart.append(imageData, withName: "image",fileName: "imageName.jpg",mimeType: "image/*")
            }, to: "http://172.17.2.159:3000/quiz/addo",headers: []).responseJSON { apiResponse in
                
                switch apiResponse.result{
                case .success(_):
                    let apiDictionary = apiResponse.value as? [String:Any]
                    print("apiResponse --- \(apiDictionary?.values)")
                  //  let storyboard = UIStoryboard(name: "Main", bundle: nil)
                 //   let mainTabBarController = storyboard.instantiateViewController(identifier: "mainTabBar")
                    
                    // This is to get the SceneDelegate object from your view controller
                    // then call the change root view controller function to change to main tab bar

                    //  (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
                case .failure(_):
                    print("got an error")
                }
            }
//            AF.request("http://172.17.2.159:3000/quiz/addquiz",method: .post,parameters: ["category": category,"correctanswer" : correctanswer,"incorrectanswer1":incorrectanswer1,"incorrectanswer2":incorrectanswer2 ,"incorrectanswer3":incorrectanswer3,"question":question,"difficulity" : difeculty],encoding: JSONEncoding.default)
//                    .validate()
//                    .responseJSON{ (data) in
//                        print(data)
//                    }
            
            //sign in
        }label:{
            Text(text).setStyle(font: .SFPBold, size: 15, color:.black).frame(width:350 ,height: 50).background(RoundedRectangle(cornerRadius: 15, style: .continuous).fill(Color.Eduapp_yellowich)).padding()
        }
    }
}
struct ResponseBtnStyle : View {
    var text : String
    var body: some View {
        Button{
            //sign in
        }label:{
            Text(text).setStyle(font: .SFPBold, size: 15, color:.black).frame(width:350 ,height: 50).background(RoundedRectangle(cornerRadius: 15, style: .continuous).fill(Color.Eduapp_yellowich)).padding()
        }
    }
}


struct Btnbook : View {
    var text : String
    var namebook : String
    var bookauth : String
    var edition : String
    var degree : String
    var immgo : UIImage?
    var urlString : URL?
    var body: some View {
        Button{
   //         guard let imageData = immgo!.jpegData(compressionQuality: 0.75) else { return }
              
            let pdfData = try! Data(contentsOf: urlString!)
                var dataa : Data = pdfData

            
            let params = ["bookname": namebook,"authname" : bookauth,"edition":edition,"degre" : degree]
            AF.upload(multipartFormData: { multiPart in
                for (key,keyValue) in params{
                            if let keyData = keyValue.data(using: .utf8){
                                multiPart.append(keyData, withName: key)
                            }
                        }
                multiPart.append(dataa, withName: "image",fileName: "imageName.pdf",mimeType: "application/pdf")
            }, to: Consts.URLbook+"addobook",headers: [])
                    .responseJSON{ (data) in
                        print(data)
                    }
        }
    label:{
            Text(text).setStyle(font: .SFPBold, size: 15, color:.black).frame(width:350 ,height: 50).background(RoundedRectangle(cornerRadius: 15, style: .continuous).fill(Color.Eduapp_yellowich)).padding()
        }
    }
}


struct QuizReponseBtnStyle : View {
    var text : String
    var body: some View {
        Button{
            //sign in
        }label:{
            Text(text).setStyle(font: .SFPBold, size: 15, color:.black).frame(width:350 ,height: 50).background(RoundedRectangle(cornerRadius: 15, style: .continuous).fill(Color.white)).padding()
        }
    }
}
//Rectangle 2

struct PageHomeTitle: View{
    var title: String
    var body: some View {
        HStack{
            Spacer()
            Text(title).setStyle(font: .SFPBold, size: 14)
            Spacer()
        }.padding(.horizontal,16)
    }
}

enum PAGEHEADERTYPE
{
case CLUB
case EVENT
}
//struct PageHeader: View{
//@Environment(\.presentationMode) var mode: Binding<PresentationMode>
//
//// var link: String
//var title: String
//var pageHeaderType : PAGEHEADERTYPE
//
//var body: some View {
//
//    HStack{
//        Image(systemName: "chevron.backward").font(.system(size: 20, weight:.medium)).foregroundColor(.white).onTapGesture {
//
//            self.mode.wrappedValue.dismiss()
//        }
//        Spacer()
//        Text(title).setStyle(font: .SFPBold, size: 14)
//        Spacer()
//        if self.pageHeaderType == .CLUB
//        {
//
//            NavigationLink(destination: ClubAddView()) {
//                Image(systemName: "plus").font(.system(size: 20, weight:.medium)).foregroundColor(Color.ClubNet_LightGreen)
//            }
//        }else if self.pageHeaderType == .EVENT
//        {
//            NavigationLink(destination: EventAddView()) {
//                Image(systemName: "plus").font(.system(size: 20, weight:.medium)).foregroundColor(Color.ClubNet_LightGreen)
//            }
//        }
//
//    }.padding(.horizontal,16)
//
//}
//}

