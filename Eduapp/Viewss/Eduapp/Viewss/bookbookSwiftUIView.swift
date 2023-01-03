//
//  bookbookSwiftUIView.swift
//  Eduapp
//
//  Created by alaa gharbi on 11/12/2022.
//

//import SwiftUI
//
//struct bookbookSwiftUIView: View {
//    @State var books :Book
//    @State var columns = Array(repeating: GridItem(.flexible(),  spacing: 15),count: 2)
//    @ObservedObject var booksviewmodel = bookViewModel()
//    var body: some View {
//
//        LazyVGrid(columns: self.columns,spacing: 25){
//            List(booksviewmodel.bookList,id:\.id){book in
//                SearchRecentlyViewedItem(recentlyViewed: book)
//
//
//        }
//            .onAppear( perform: booksviewmodel.getAllBooks)
//        //
//        //
//    }
//    }
//}
//
//struct SearchRecentlyViewedItem: View {
//
//    var recentlyViewed: Book
//
//
//
//    var body: some View {
//
//        ImageTextButton(image: "String", bookname: recentlyViewed.bookname, authname: recentlyViewed.authname, buttonText: "", edition: recentlyViewed.edition, degre: recentlyViewed.degree)
//
//    /*    .frame(width: ScreenSize.screenWidth-32)
//*/
//        .onTapGesture {
//
//            let defaults = UserDefaults.standard
//
//            defaults.set(recentlyViewed.id,forKey: "id")
//
//        }
//
//    }
//
//}
//
