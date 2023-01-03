//
//  textimagebuttonView.swift
//  Eduapp
//
//  Created by alaa gharbi on 11/12/2022.
//

import SwiftUI

struct ImageTextButton: View {

    

    let image: String

    let bookname: String

    let authname: String

    let buttonText: String

    let edition: String

    let degre: String
    



    

    var body: some View  {

        HStack(spacing: 0) {

            Image(image)

                .padding(.trailing, 15)

            

            textContent

            Spacer()

            button

        }

    }

    

    var textContent: some View {

        VStack(alignment: .leading, spacing: 0) {

            Text(bookname)

                .font(Font.subheadline.bold())

            

            Text(authname)

                .font(Font.footnote.weight(.regular))

                .foregroundColor(Color.yellow)

        }

    }

    

    var button: some View {

        NavigationLink(

            destination: self

              /*  RestaurantDetailView(detailView: RestaurantPostModel(id: "", name: name, address: address, email: email, phone: phone, description: description))
*/
        ) {

            Text(buttonText)

        }
        /*
        .buttonStyle(SecondaryButton(buttonTextColor: Colors.orange, buttonBackground: Colors.quaternary))
*/
        

    }

    

   



 



}
