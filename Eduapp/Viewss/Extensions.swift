//
//  Extensions.swift
//  EduApp
//
//  Created by alaa gharbi on 19/11/2022.
//
import Foundation
import SwiftUI

extension Text{
    func setStyle(font:EduApp_Fonts = .SFPRegular , size:CGFloat = 14, color:Color = .black) -> some View {
        self.modifier(SetTextFont(font: font, size: size ,color:color))
    }
}
extension View{
    func applyBackground() -> some View {
        self.modifier(SetBackground())
    }
}

// Extension for adding rounded corners to specific corners
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}

// Custom RoundedCorner shape used for cornerRadius extension above
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
extension Date {
    
    func toString()-> String{
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_EN")
        formatter.dateFormat = "EEEE, MMM d, yyyy"
        
        
        return formatter.string(from: self)
    }
    
}
extension Date {
    
    func toStringDetail()-> String{
        
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE HH:mm, MMM d, yyyy"
        return formatter.string(from: self)
    }
    
}
extension Date {
    func toBithdate()-> String{
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_EN")
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self)
    }
}

extension Text {
    func lilacTitle() -> some View {
        self.font(.title).fontWeight(.heavy).foregroundColor(.black)
    }
    
}

