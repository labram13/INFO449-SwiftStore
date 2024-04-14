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

class Receipt {}

class Register {}

class Store {
    let version = "0.1"
    func helloWorld() -> String {
        return "Hello world"
    }
}

