//
//  BuyButtonStyle.swift
//  WhoLovesTori
//
//  Created by 권유진 on 2022/06/22.
//

import SwiftUI

struct BuyButtonStyle: ButtonStyle {
    
    let isPurchased: Bool
    
    init(isPurchased: Bool = false) {
        self.isPurchased = isPurchased
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
        var bgColor: Color = isPurchased ? Color.green: Color.blue
        bgColor = configuration.isPressed ? bgColor.opacity(0.7): bgColor.opacity(1)
        return configuration.label
            .frame(width: 65)
            .padding(5)
            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
    
}

