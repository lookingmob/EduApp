//
//  bookPickerView.swift
//  Eduapp
//


import SwiftUI

struct bookPickerView: View {
    
    @Binding var selectedbook:BookModel?
    @Binding var showDropdown:Bool
    
    @State  var book:[BookModel] = [BookModel(degre: NSLocalizedString("level 1", comment: "")),BookModel( degre: NSLocalizedString("level 2", comment: "")),BookModel( degre: NSLocalizedString("level 3", comment: "")),BookModel( degre: NSLocalizedString("level 4", comment: "")),BookModel( degre: NSLocalizedString("level 5", comment: ""))]
    
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

