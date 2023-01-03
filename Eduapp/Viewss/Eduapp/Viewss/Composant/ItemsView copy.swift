
import SwiftUI

struct BookItem: View{
    
    var degre : String
 
    
    var body: some View {
        HStack{
            Text(degre).setStyle(font: .SFPRegular, size: 18)
            Spacer()
        }.padding()
    }
}
