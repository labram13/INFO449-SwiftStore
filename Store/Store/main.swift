//
//  main.swift
//  Store
//
//  Created by Ted Neward on 2/29/24.
//

import Foundation

protocol SKU {
    var name: String { get }
    func price() -> Int
}

class Item: SKU {
    var name: String
    var itemPrice: Int
    
    init(_ name: String, _ price: Int) {
        self.name = name
        self.itemPrice = price
    }
    
    func price() -> Int {
        return self.itemPrice
    }
}

class Receipt {
    var items: [SKU] = []
}

class Register {
    var receipt: Receipt
    
    init(receipt: Receipt) {
        self.receipt =  Receipt()
    }
    
    func subtotal() -> String {
        //convert to string
        //return total so far.
        return ""
    }
    
    func total() -> String {
        //clear receipt
        self.receipt.items.removeAll()
        return ""
    }
}

class Store {
    let version = "0.1"
    func helloWorld() -> String {
        return "Hello world"
    }
}

