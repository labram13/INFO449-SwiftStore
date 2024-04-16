//
//  main.swift
//  Store
//
//  Created by Ted Neward on 2/29/24.
//

//Implemented functionality and tests for the following extra credit features:
// - Added discount for 2-1 items
// - Added classes and tests to add fruits, veggies, and meet (rounds up to the nearest penny)
// - Added group buy functionality (PrincingScheme) and testing for group buys on ketchup and beer.

import Foundation

protocol SKU {
    var name: String { get }
    func price() -> Int
}

class Item: SKU {
    var name: String
    var itemPrice: Int
    var type: String?
    
    init(name: String, priceEach: Int) {
        self.name = name
        self.itemPrice = priceEach
        self.type = "Non-food"
    }
    
    init(name: String, priceEach: Int, _ type: String) {
        self.name = name
        self.itemPrice = priceEach
        self.type = type
    }
    
    func price() -> Int {
        return self.itemPrice
    }
}

class WeighedFood: SKU {
    var name: String
    var itemPrice: Int
    var type : String
    
    init(_ name: String, _ pricePerPound: Int, _ weight: Double, _ type: String) {
        self.name = name
        let adjustPrice = ceil(weight * Double(pricePerPound))
        self.itemPrice = Int(adjustPrice)
        self.type = type
    }
    
    func price() -> Int {
        return self.itemPrice
    }
}

class Receipt {
    var allItems: [SKU] = []
    var itemCounts = [String: Int]()
    var itemPrice = [String: Int]()
    
    func items() -> [SKU] {
        return allItems
    }
    
    func output() -> String {
        var total = 0
        var twoOneDiscount = 0
        var totalDiscount = 0
        var priceSchemeDiscount = 0
        var receiptOutput = """
Receipt:
"""
        for item in allItems {
            total += item.price()
            receiptOutput += "\n\(item.name): $\(Double(item.price()) / 100.0)"
        }
        receiptOutput += "\n------------------"
        
        //check for 2-1 discounts
        for item in itemCounts.keys {
            let discountNum = itemCounts[item]! / 3
            twoOneDiscount += discountNum * itemPrice[item]!
            total = total - (discountNum * itemPrice[item]!)
            totalDiscount += twoOneDiscount
        }
        //show discount on receipt if there are any 2-1
        if (twoOneDiscount > 0) {
            receiptOutput += "\n2-1 DISCOUNT: $-\(Double(twoOneDiscount) / 100.0)"
        }
        print(total)
        //check pricing scheme
        if PricingScheme() {
            priceSchemeDiscount += Int(ceil(Double(total) * 0.10))
            total -= priceSchemeDiscount
        }
        
        
        //show scheme discount on receipt if any
        if (priceSchemeDiscount > 0) {
            receiptOutput += "\nGROUP BUY DISCOUNT: $-\(Double(priceSchemeDiscount) / 100.0)"
        }
        
        receiptOutput += "\nTOTAL: $\(Double(total) / 100.0)"
        return receiptOutput
    }
    
    func total() -> Int {
        var total = 0
        for item in allItems {
            total += item.price()
        }
        for item in itemCounts.keys {
            let discountNum = itemCounts[item]! / 3
            total = total - (discountNum * itemPrice[item]!)
        }
        if PricingScheme() {
            let priceSchemeDiscount = Int(ceil(Double(total) * 0.10))
            total -= priceSchemeDiscount
        }
        return total
    }
    
    func PricingScheme() -> Bool {
        return itemPrice.keys.contains("Beer") &&
        itemPrice.keys.contains("Ketchup")
    }
    
}

class Register {
    var receipt: Receipt
    
    init() {
        self.receipt =  Receipt()
    }
    
    func scan(_ item: SKU) {
        receipt.allItems.append(item)
        if let count = receipt.itemCounts[item.name] {
            receipt.itemCounts[item.name] = count + 1
        } else {
            receipt.itemCounts[item.name] = 1
            receipt.itemPrice[item.name] = item.price()
        }
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

