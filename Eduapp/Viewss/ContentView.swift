//
//  ContentView.swift
//  Eduapp
//
//  Created by alaa gharbi on 8/12/2022.
//

import SwiftUI
import FirebaseCore



struct ContentView: View {
    @State var search = ""
    @State var index = 0
    @State var books :Book
    @StateObject var cartManager = CartManager()
    //  @State var columns = Array(repeating: GridItem(.flexible(),  spacing: 15),count: 2)
    @ObservedObject var booksviewmodel = bookViewModel()
    var body: some View {
        NavigationView {
            
            ScrollView(.vertical, showsIndicators:  false){
                
                LazyVStack{
                    HStack{
                        Text("book store")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                    }
                    .padding(.horizontal)
                    TextField("search",text: $search)
                    
                        .padding(.vertical,10)
                        .padding(.horizontal)
                        .background(Color.black.opacity(0.07))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    // carousel list
                    TabView(selection: self.$index){
                        
                        ForEach(0...4,id: \.self){index in
                            Image("p\(index)")
                                .resizable()
                            //adding animation...
                                .frame(height: self.index == index ? 230 : 180)
                                .cornerRadius(15)
                                .padding(.horizontal)
                                .padding(.top,25)
                            //for identifying current index...
                                .tag(index)
                        }
                        
                    }
                    .frame(height: 230)
                    .padding(.top,25)
                    .tabViewStyle(PageTabViewStyle())
                    .animation(.easeOut)
                    //adding custom Grid...
                    VStack{
                        
                        Text("Popular")
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                        HStack{
                            //                        Button {
                            
                            //                        }
                            //                    label: {
                            //                        Image(systemName:"square.grid.2x2")
                            //                            .font(.system(size: 24))
                            //                            .foregroundColor(.black)
                            //                    }
                            /* //rating
                             Button {
                             
                             } label: {
                             Image(systemName: "heart.fill")
                             .foregroundColor(.Eduapp_yellowich)
                             .padding(.all,10)
                             .background(Color.white)
                             .clipShape(Circle())
                             }
                             }*/
                            
                            //                    .padding(.horizontal)
                            //                    .padding(.top,25)
                            
                            //research
                            //
                            //                         ForEach(search == "" ? booksviewmodel.books: booksviewmodel.books.filter{$0.bookname.lowercased().contains(search.lowercased())})
                            //                         {
                            //                         item in
                            //                         GridView(book: $booksviewmodel.books[item])
                            //
                            //                         }
                            //
                            //  list
                            
                            ScrollView{
                                ForEach(0..<booksviewmodel.books.count , id: \.self ) {
                                    item in

                                        GridView(book: $booksviewmodel.books[item]).environmentObject(cartManager)
                                    
                                    //  SearchRecentlyViewedItem1(recentlyViewed: booksviewmodel.bookList[item])
                                }.padding(.trailing)
                                
                            }
                            .onAppear(perform: {
                                booksviewmodel.getAllBooks()
                                // print( booksviewmodel.bookList)
                            })}
                        //*/
                        //
                        
                        .padding([.horizontal,.top])
                        
                        
                        .padding(.vertical)
                    }
                }
                .background(Color.black.opacity(0.05).edgesIgnoringSafeArea(.all))
            }
            .navigationTitle(Text("Book Shop"))
            .toolbar {
                NavigationLink {
                    CartView()
                        .environmentObject(cartManager)
                } label: {
                    CartButton(numberOfProducts: cartManager.books.count)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
       
        
    }
    
    
    ///
        struct GridView : View {
            @Binding var book : Book
            @State var isPressedButton:Bool = false
            @EnvironmentObject var cartManager: CartManager
           // @StateObject var cartManager = CartManager()
            var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
            
            var body: some View{
                
                VStack{
                    VStack(spacing: 15){
                        
                        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                            
                            AsyncImage(url: URL(string: Consts.URL_IMAGE+"\(book.image)")){ image in
                                image.resizable()
                                
                                
                            }placeholder: {
                                ProgressView()
                            }
                            .frame( width: 250,height: 250)
                            .cornerRadius(15)
                            Button {
                                cartManager.addToCart(book:book)
                            } label: {
                                Image(systemName: "plus")
                                    .padding(10)
                                    .foregroundColor(.white)
                                    .background(.black)
                                    .cornerRadius(50)
                                    .padding()
                            }
                            .padding(.all,10)
                        }
                        
                        VStack(alignment: .leading, spacing: 10 ){
                            
                            Text(book.bookname)
                                .fontWeight(.bold)
                                .lineLimit(1)
                            VStack(alignment: .leading, spacing: 10 ){
                                
                                Text(book.authname)
                                    .fontWeight(.bold)
                                    .lineLimit(1)
                                Text("\(book.price)$")
                                    .font(.caption)
                                //Rating Bar...
                                
                                //plus
                                HStack(spacing: 10){
                                    
                                    //                                 ForEach(1...5,id: \.self){rating in
                                    //                                    Image(systemName: "star.fill")
                                    //                                 .foregroundColor(self.book.rating >= rating ? .yellow : .gray)
                                    //                                     }                                    Spacer(minLength: 0)
                                    //                                }
                                    NavigationLink(destination:bookDetail(resto: book),isActive: $isPressedButton){
                                        
                                        Button(action: {isPressedButton = true}, label: {
                                            
                                            Text("detailsbook")
                                            
                                                .fontWeight(.bold)
                                            
                                                .foregroundColor(.white)
                                            
                                                .padding(.vertical, 10)
                                            
                                                .padding(.horizontal, 100)
                                            
                                                .background(Color.red)
                                            
                                                .cornerRadius(10)
                                            
                                            
                                            
                                        })
                                        
                                    }
                                    
                                    
                                }}
                            
                            
                            
                            
                            
                        }
                        
                    }
                    
                    
                    
                }}
            
        }}

