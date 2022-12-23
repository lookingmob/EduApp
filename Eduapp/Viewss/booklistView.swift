import SwiftUI
struct booklistView_Previews: PreviewProvider {
    static var previews: some View {
        booklistView()
    }
}

struct booklistView: View {
    
  //   var books:[BookModel]
    //    @ObservedObject var bookViewModel :bookViewModel
    //   init(books:[BookModel],clubViewModel :bookViewModel)
    //  {      self.books = books
    //       self.bookViewModel  = bookViewModel
    //   }
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false){
            
        }
    }
}
       // VStack{
            
            
//            VStack{
//                ZStack{
//                    VStack {
//                    }   .frame(maxWidth: .infinity,maxHeight: 40, alignment: .leading)
//                        .padding()
//                        .padding(.bottom, 20)
//                        .background(Color.Eduapp_yellowich)
//                        .cornerRadius(20, corners: [.bottomLeft, .bottomRight]).overlay(alignment:.bottom){
//
//                            PageHeader(title:"Book LIST",pageHeaderType:.BOOK).padding(.bottom,16)
//                        }
//                }
//            }
//
//
//            VStack{
//                HStack{
//                    Spacer()
//                }.padding(.horizontal,8)
//                ScrollView(showsIndicators: false){
//                    VStack{
//                        ForEach (books , id: \.id) {
//                            item in
//                            NavigationLink(destination: bookDetailView) {
//                                BookItem(degre: item.degre ?? "")
//                            }
//                            Divider().background(.white.opacity(0.1)).frame(width:300,height:5,alignment: .center)
//
//                        }
//                    }
//               }.padding()
//           }
//  //




