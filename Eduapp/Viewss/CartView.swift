
import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ScrollView {
            if cartManager.paymentSuccess {
                Text(NSLocalizedString("Thanks for your purchase! You'll get cozy in our comfy sweaters soon! You'll also receive an email confirmation shortly.", comment: ""))
                    .padding()
            } else {
                if cartManager.books.count > 0 {
                    ForEach(cartManager.books, id: \.id) { book in
                        ProductRow(book: book)
                    }
                    
                    HStack {
                        Text(NSLocalizedString("Your cart total is", comment: ""))
                        Spacer()
                        Text("$\(cartManager.total).00")
                            .bold()
                    }
                    .padding()
                    
                    PaymentButton(action: cartManager.pay)
                        .padding()
                    
                } else {
                    Text(NSLocalizedString("Your cart is empty.", comment: ""))
                }
            }
        }
        .navigationTitle(Text(NSLocalizedString("My Cart", comment: "")))
        .padding(.top)
        .onDisappear {
            if cartManager.paymentSuccess {
                cartManager.paymentSuccess = false
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}

