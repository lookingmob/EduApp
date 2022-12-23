//
//  bookPickerView.swift
//  Eduapp
//


import SwiftUI

struct bookPickerView: View {
    
    @Binding var selectedbook:BookModel?
    @Binding var showDropdown:Bool
    
    @State  var book:[BookModel] = [BookModel(degre: "level1"),BookModel( degre: "level2"),BookModel( degre: "level3"),BookModel( degre: "level4"),BookModel( degre: "level5")]
    
    var body: some View {
        
        VStack
        {
            ScrollView{
                ForEach (book, id: \.id) {
                    item in
                    BookItem(degre: item.degre ?? "").onTapGesture {
                        withAnimation(.easeInOut)
                        {
                            self.selectedbook = item
                            self.showDropdown = false
                        }
                    }
                }
            }
            
        }.frame(maxWidth:.infinity , maxHeight: 200)
    }
}

struct BookModel
{
    var id = UUID()
    var degre:String?
    
}

