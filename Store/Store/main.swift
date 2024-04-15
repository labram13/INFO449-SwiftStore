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
    
    init(name: String, priceEach: Int) {
        self.name = name
        self.itemPrice = priceEach
    }
    
    func price() -> Int {
        return self.itemPrice
    }
}

class Receipt {
    var allItems: [SKU] = []
    
    func items() -> [SKU] {
        return allItems
    }
    
    func output() -> String {
        var total = 0;
        var receiptOutput = """
Receipt:
"""
        for item in allItems {
            receiptOutput += "\n\(item.name): $\(Double(item.price()) / 100.0)"
            total += item.price()
        }
        receiptOutput += "\n------------------"
        receiptOutput += "\nTOTAL: $\(Double(total) / 100.0)"
        return receiptOutput
    }
    
    func total() -> Int {
        var total = 0
        print(allItems.count)
        for item in allItems {
            total += item.price()
        }
        print(total)
        return total
    }
    
}

class Register {
    var receipt: Receipt
    
    init() {
        self.receipt =  Receipt()
    }
    
    func scan(_ item: Item) {
        receipt.allItems.append(item)
    }
    
    func subtotal() -> Int {
        var subtotal = 0
        for item in receipt.allItems {
            subtotal += item.price()
        }
        return subtotal
    }
    
    func total() -> Receipt {
        let endReceipt = self.receipt
        self.receipt = Receipt()
        return endReceipt
    }
     
    
}

class Store {
    let version = "0.1"
    func helloWorld() -> String {
        return "Hello world"
    }
}

