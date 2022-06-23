//
//  ListCellView.swift
//  WhoLovesTori
//
//  Created by 권유진 on 2022/06/22.
//

import SwiftUI

struct ListCellView_Previews: PreviewProvider {
    static var previews: some View {
        ListCellView(productUI: ProductUI(tuple: Store.tories[1]))
            .previewLayout(.fixed(width: 350, height: 80))
            .environmentObject(Store())
        ListCellView(productUI: ProductUI(tuple: Store.subscriptions[1]))
            .previewLayout(.fixed(width: 350, height: 80))
            .environmentObject(Store())
    }
}

struct ListCellView: View {
    
    var _productUI: ProductUI
    let _purchasingEnabled: Bool
    
    @State var __isPurchased: Bool = false
    
    init(productUI: ProductUI, purchasingEnabled: Bool = true) {
        self._productUI = productUI
        self._purchasingEnabled = purchasingEnabled
    }
    
    var body: some View {
        HStack {
            Text(_productUI.displayName)
                .font(.system(size: 20))
                .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                .padding(5)
            
            if _purchasingEnabled {
                Vu_1ProductDetail
            } else {
                vuBuilder_productDetail
            }
            
            if _purchasingEnabled {
                Spacer()
                BuyButton
                    .buttonStyle(BuyButtonStyle(isPurchased: __isPurchased))
                    .disabled(__isPurchased)
            }
            
        }
    }
    
    var Vu_1ProductDetail: some View {
        VStack(alignment: .leading) {
            Text(_productUI.displayName).bold()
            Text(_productUI.description)
        }
    }
    
    @ViewBuilder
    var vuBuilder_productDetail: some View {
        if _productUI.type == "Auto-Renewalbe" {
            VStack(alignment: .leading) {
                Text(_productUI.displayName).bold()
                Text(_productUI.description)
            }
        } else {
            Text(_productUI.description)
                .frame(alignment: .leading)
        }
    }
    
    var BuyButton: some View {
        Button(action: {
        }) {
            if __isPurchased {
                Text(Image(systemName: "checkmark")) .bold()
                    .foregroundColor(.white)
            } else {
                Text(_productUI.displayPrice)
                    .foregroundColor(.white)
                    .bold().font(.system(size: 16))
            }
        }
    }
    
}

