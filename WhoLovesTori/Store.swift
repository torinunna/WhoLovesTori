//
//  Store.swift
//  WhoLovesTori
//
//  Created by 권유진 on 2022/06/21.
//

import Foundation


struct ProductUI {
    
    var id: String = UUID().uuidString
    var displayPrice: String = "₩1,000"
    var type: String {
        willSet {
            assert(ProductUI.KeyCheck(newValue))
        }
    }
    var displayName: String = "Initial display Name"
    var description: String = "Initial Description"
    
    init(tuple:(String, String, String, String, String)) {
        id = tuple.0
        displayPrice = tuple.1
        type = tuple.2
        displayName = tuple.3
        description = tuple.4
    }
    
    static let types_: Set = ["Consumable", "Auto-Renewalbe", "Free"]
    static func KeyCheck(_ type: String) -> Bool {
        return types_.contains(type)
    }
}

class Store: ObservableObject {
    
    static let Tories = [
        
//         id . displayPrice . type . displayName . description
        ("Tori.lowQuality", "무료", "Free", "저화질의 토리", "저화질일수록 뽀짝한 토리"),
        ("Tori.random", "₩100", "Consumable", "5토리", "랜덤으로 5장의 토리")
        
    ]
    
    static let subscriptions = [
        
//         id . displayPrice . type . displayName . description
        ("Tori.daily", "₩1,000", "Auto-Renewable", "하루토리", "한 달간 매일 토리를 만나요"),
        ("Tori.weekly", "1,000", "Auto-Renewable", "주간토리", "한 달간 매주 토리를 만나요"),
        ("Tori.monthly", "₩1,000", "Auto-Renewable", "월간토리", "3개월간 매월 토리를 만나요"),
    ]
    
    static let extraTories = [
        
//         id . displayPrice . type . displayName . description
        ("Tori.video", "₩100", "Consumable", "움직이는 토리", "움직이는 토리를 만나요"),
        ("Tori.ofTheDay", "₩100", "Consumable", "오늘의 토리", "오늘의 토리 :)")
    ]
    
    static let error = [
    
//         id . displayPrice . type . displayName . description
        (UUID().uuidString, "$error", "type Error", "Bad prdClass", "Parameter is wrong - Bad prdClass")
    ]
    
    static func PreviewProductUIs(_ prdClass: String, _ count: Int) -> [ProductUI] {
        var rpd = [ProductUI]()
        switch(prdClass) {
        case "extra":
            for i in 0..<count {
                rpd.append(ProductUI(tuple: Store.extraTories[i]))
            }
        case "Tories":
            for i in 0..<count {
                rpd.append(ProductUI(tuple: Store.Tories[i]))
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
