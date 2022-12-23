//
//  CartManager.swift
//  SweaterShopApp
//
//  Created by Stephanie Diep on 2022-01-03.
//

import Foundation

class CartManager: ObservableObject {
    @Published private(set) var books: [Book] = []
    @Published private(set) var total: Int = 0
    
    // Payment-related variables
    let paymentHandler = PaymentHandler()
    @Published var paymentSuccess = false
    
    
    // Functions to add and remove from cart
    func addToCart(book: Book) {
        books.append(book)
        total += book.price
    }
    
    func removeFromCart(book: Book) {
        books = books.filter { $0.id != book.id }
        total -= book.price
    }
    
    // Call the startPayment function from the PaymentHandler. In the completion handler, set the paymentSuccess variable
    func pay() {
        paymentHandler.startPayment(books: books, total: total) { success in
            self.paymentSuccess = success
            self.books = []
            self.total = 0
        }
    }
}
