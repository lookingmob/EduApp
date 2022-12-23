import SwiftUI
import Alamofire



struct bookDetail: View {

 
    @ObservedObject var booksviewmodel = bookViewModel()

@State var resto : Book

    @State var heart = "heart.fill"

    @State var isPressedButton :Bool=false

    var placeHolder = "Test it"

    var body: some View {

            VStack {

                ScrollView(.vertical, showsIndicators: false, content: {

                    GeometryReader{reader in

                        AsyncImage(url: URL(string: Consts.URL_IMAGE+"\(resto.image)")){ image in
                            image.resizable()
                            
                            
                        }placeholder: {
                            ProgressView()
                        }
                            .aspectRatio(contentMode: .fill)

                        

                            .offset(y: -reader.frame(in: .global).minY)

//                         going to add parallax effect....

                            .frame(width: UIScreen.main.bounds.width, height:  reader.frame(in: .global).minY + 300)

                        

                    }

                    .frame(height: 280)

                    

                    VStack(alignment: .leading,spacing: 15){

                        

                        Text(resto.authname)

                         //   .font(.system(size: 35, weight: .bold))

                        

                        

                        HStack(spacing: 10){

                            

                            ForEach(1..<5){_ in

                                

                                Image(systemName: "star.fill")

                                    .foregroundColor(.yellow)

                            }

                        }

                        

                        HStack {

                            Text(placeHolder)

                                .font(.caption)

                                .foregroundColor(.gray)

                                .padding(.top,5)

                            Spacer()

                            

                            Button(action: {

                               
                                    
                                    
                                    AF.request(Consts.URLlike,method: .post,parameters: ["idUser": UserDefaults.standard.string(forKey: "id")!,"idBook" : resto.id],encoding: JSONEncoding.default)
                                        .validate()
                                        .responseJSON { apiResponse in
                                            
                                            switch apiResponse.result{
                                            case .success(_):
                                                let apiDictionary = apiResponse.value as? [String:Any]
                                                print("apiResponse --- \(apiDictionary?.values)")
                                                if(heart !=  "heart" ){
                                            heart = "heart"
                                        }
                                    else{
                                            heart="heart.fill"
                                        }
                                            case .failure(_):
                                                print("got an error")
                                            }
                                        }
//
                                

                            }, label: {

                                Image(systemName: heart)

                                    .font(.largeTitle)

                                    .foregroundColor(.red)

                                

                            })

                            .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)

                        }

                        

                        

                        Text("Description")

                            .font(.system(size: 25, weight: .bold))

                        

                    //    Text(resto.description)

                            .padding(.top, 10)

                            .fixedSize(horizontal: false, vertical: true)

                        


                    }

                    .padding(.top, 25)

                    .padding(.horizontal)

                    .background(Color.white)

                    .cornerRadius(20)

                    .offset(y: -35)

                })

                

                

                Spacer()

                

                HStack{

                    Spacer()

//                    NavigationLink(destination:ContentView(books: Book(id: "", bookname: "", authname: "", edition: "", degre: "",image: "")),isActive: $isPressedButton){
//
//                        Button(action: {isPressedButton=true}, label: {
//
//                            Text("Return to book")
//
//                                .fontWeight(.bold)
//
//                                .foregroundColor(.white)
//
//                                .padding(.vertical, 10)
//
//                                .padding(.horizontal, 100)
//
//                                .background(Color.red)
//
//                                .cornerRadius(10)
//
//

                       // })

                   // }

                    Spacer()

                }

                .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)

                

                .edgesIgnoringSafeArea(.all)

                .background(Color.white.edgesIgnoringSafeArea(.all))

            }.onAppear(perform: {
                booksviewmodel.getBook()
                // print( booksviewmodel.bookList)
            })

        

    }

    

}
