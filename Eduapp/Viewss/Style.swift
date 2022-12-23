//
//  Style.swift
//  EduApp
//
//  Created by alaa gharbi on 19/11/2022.
//

import Foundation
import SwiftUI
extension Color{
    static let EduApp_DarkBlue: Color = Color("DarkBlue")
    static let EduApp_LightBlue: Color = Color("LightBlue")
    static let EduApp_LightGreen: Color = Color("LightGreen")
    static let EduApp_LightG1: Color = Color("GreyADA8B8")
    static let EduApp_LightG2: Color = Color("LightG2")
    static let Eduapp_grayhalfdegree: Color = Color("EduAppGrey")

    static let Eduapp_White: Color = Color("EduAppWhite")
    static let Eduapp_btnsignred: Color = Color("BntnredLinl")

    static let Eduapp_yellowich: Color = Color("EduAppYellowich")
    
    static let Eduappred: Color = Color("EduAppRed")
    static let Eduapp_red_magenta: Color = Color("EduAppsured")
    static let Eduapp_ansergrey: Color = Color("EduAppAnserGrey")
}


enum EduApp_Fonts : String
{
    case SFPRegular = "SFProText-Regular"
    case SFPItalic = "SFProText-Italic"
    case SFPUltralight = "SFProText-Ultralight"
    case SFPLight = "SFProText-Light"
    case SFPMedium = "SFProText-Medium"
    case SFPSemiboldItalic = "SFProText-SemiboldItalic"
    case SFPBold = "SFProText-Bold"
}



struct SetTextFont: ViewModifier {
    var font : EduApp_Fonts
    var size : CGFloat
    var color: Color
    
    init(font:EduApp_Fonts, size:CGFloat, color:Color){
        self.font = font
        self.size = size
        self.color = color
    }
    
    func body(content: Content) -> some View {
        content.font(.custom(self.font.rawValue, size: self.size)).foregroundColor(color)
    }
}
struct  SetBackground: ViewModifier {
  
    func body(content: Content) -> some View {
        content.frame(maxWidth: .infinity, maxHeight: .infinity, alignment:.center).navigationBarHidden(true).navigationBarBackButtonHidden(true)
    }
}
struct PageHeader: View{
@Environment(\.presentationMode) var mode: Binding<PresentationMode>

// var link: String
var title: String
var pageHeaderType : PAGEHEADERTYPE

var body: some View {
    
    HStack{
        Image(systemName: "chevron.backward").font(.system(size: 20, weight:.medium)).foregroundColor(.white).onTapGesture {
            
            self.mode.wrappedValue.dismiss()
        }
        Spacer()
        Text(title).setStyle(font: .SFPBold, size: 14)
        Spacer()
        if self.pageHeaderType == .CLUB
        {
            
            NavigationLink(destination: AddQuiz()) {
                Image(systemName: "plus").font(.system(size: 20, weight:.medium)).foregroundColor(Color.EduApp_LightBlue)
            }
        }else if self.pageHeaderType == .EVENT
        {
            NavigationLink(destination: AddQuiz()) {
                Image(systemName: "plus").font(.system(size: 20, weight:.medium)).foregroundColor(Color.EduApp_LightGreen)
            }
        }
        
    }.padding(.horizontal,16)
    
}
}
