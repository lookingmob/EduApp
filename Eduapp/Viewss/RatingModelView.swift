//
//  RatingModelView.swift
//  Eduapp
//
//  Created by Islem Naffeti
//

import Foundation



class RatingModelView: ObservableObject{

    @Published var ListRatings = [RatingUserProduct]()

    @Published var ListRating = [RatingUserProduct]()

    static let sharedInstance = RatingModelView()

    let prefix = "http://172.17.1.81:3000"

    

    func AddRate(idUser: String,idBook:String,rating:Int) {

        print(rating)

        let parameters: [String: Any] = [

            "idUser":idUser ,

            "idBook": idBook,

            "rating": rating

        ]

        guard let url = URL(string: "\(prefix)/rating/add") else {

            print("not found")

            return

        }

        let data = try! JSONSerialization.data(withJSONObject: parameters)

        

        var request = URLRequest(url: url)

        request.httpMethod = "POST"

        request.httpBody = data

        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        

        

        URLSession.shared.dataTask(with: request) {

            (data , res , error) in

            if error != nil

            {

                print ("error", error?.localizedDescription ?? "")

                return

            }

            do {

                if let data = data {

                    let result = try JSONDecoder().decode(RatingUserProduct.self, from: data)

                    DispatchQueue.main.async {

                        print(result)

                    }

                    

                }

                else {

                    print ("no data")

                }

            } catch let JsonError {

                

                print("fetch json error :", JsonError.localizedDescription)

                print(String(describing: JsonError))

                

            }

        }.resume()

    }

    

   

}
