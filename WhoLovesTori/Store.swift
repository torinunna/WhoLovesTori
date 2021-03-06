//
//  Store.swift
//  WhoLovesTori
//
//  Created by ๊ถ์ ์ง on 2022/06/21.
//

import Foundation


struct ProductUI {
    
    var id: String = UUID().uuidString
    var emoji: String = "๐งธ"
    var displayPrice: String = "โฉ1,000"
    var type: String {
        willSet {
            assert(ProductUI.KeyCheck(newValue))
        }
    }
    var displayName: String = "Initial display Name"
    var description: String = "Initial Description"
    
    init(tuple:(String, String, String, String, String, String)) {
        id = tuple.0
        emoji = tuple.1
        displayPrice = tuple.2
        type = tuple.3
        displayName = tuple.4
        description = tuple.5
    }
    
    static let types_: Set = ["Consumable", "Auto-Renewalbe", "Free"]
    static func KeyCheck(_ type: String) -> Bool {
        return types_.contains(type)
    }
}

class Store: ObservableObject {
    
    static let tories = [
        
//         id . displayPrice . type . displayName . description
        ("Tori.lowQuality", "๐", "๋ฌด๋ฃ", "Free", "์ ํ์ง์ ํ ๋ฆฌ", "์ ํ์ง์ผ์๋ก ๋ฝ์งํ ํ ๋ฆฌ"),
        ("Tori.random", "๐ฒ", "โฉ100", "Consumable", "5ํ ๋ฆฌ", "๋๋ค์ผ๋ก 5์ฅ์ ํ ๋ฆฌ")
        
    ]
    
    static let subscriptions = [
        
//         id . emoji . displayPrice . type . displayName . description
        ("Tori.daily", "1๏ธโฃ", "โฉ1,000", "Auto-Renewable", "ํ๋ฃจํ ๋ฆฌ", "ํ ๋ฌ๊ฐ ๋งค์ผ ํ ๋ฆฌ๋ฅผ ๋ง๋์"),
        ("Tori.weekly", "7๏ธโฃ", "1,000", "Auto-Renewable", "์ฃผ๊ฐํ ๋ฆฌ", "ํ ๋ฌ๊ฐ ๋งค์ฃผ ํ ๋ฆฌ๋ฅผ ๋ง๋์"),
        ("Tori.monthly", "๐", "โฉ1,000", "Auto-Renewable", "์๊ฐํ ๋ฆฌ", "3๊ฐ์๊ฐ ๋งค์ ํ ๋ฆฌ๋ฅผ ๋ง๋์"),
    ]
    
    static let extraTories = [
        
//         id . emoji. displayPrice . type . displayName . description
        ("Tori.moving", "๐น", "โฉ300", "Consumable", "์์ง์ด๋ ํ ๋ฆฌ", "์์ง์ด๋ ํ ๋ฆฌ๋ฅผ ๋ง๋์ x3"),
        ("Tori.ofTheDay", "๐งธ", "โฉ100", "Consumable", "์ค๋์ ํ ๋ฆฌ", "์ค๋์ ํ ๋ฆฌ x5 :)")
    ]
    
    static let error = [
    
//         id . emoji . displayPrice . type . displayName . description
        (UUID().uuidString, "โฝ", "$error", "type Error", "Bad prdClass", "Parameter is wrong - Bad prdClass")
    ]
    
    static func PreviewProductUIs(_ prdClass: String, _ count: Int) -> [ProductUI] {
        
        var rpd = [ProductUI]()
        
        switch(prdClass) {
        case "extraTories":
            for i in 0..<count {
                rpd.append(ProductUI(tuple: Store.extraTories[i]))
            }
        case "tories":
            for i in 0..<count {
                rpd.append(ProductUI(tuple: Store.tories[i]))
            }
        case "subscriptions":
            for i in 0..<count {
                rpd.append(ProductUI(tuple: Store.subscriptions[i]))
            }
        default:
            var errPrd = ProductUI(tuple: Store.error[0])
            errPrd.displayName = "Bad parameter"
            errPrd.description = "\"\(prdClass)\""
            rpd.append(errPrd)
        }
        return rpd
    }
    
    
}
