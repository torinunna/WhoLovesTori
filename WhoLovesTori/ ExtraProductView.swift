//
//   ExtraProductView.swift
//  WhoLovesTori
//
//  Created by 권유진 on 2022/06/23.
//

import SwiftUI



struct ExtraProductView_Previews: PreviewProvider {
    static var previews: some View {
        ExtraProductView(productUI: ProductUI(tuple: Store.extraTories[0]), onPurchase: {_ in})
            .previewLayout(.fixed(width:200, height: 300))
            .preferredColorScheme(.light)
        ExtraProductView(productUI: ProductUI(tuple: Store.extraTories[1]), onPurchase: {_ in})
            .previewLayout(.fixed(width:200, height: 300))
            .preferredColorScheme(.dark)
    }
}

struct ExtraProductView: View {
    
    @EnvironmentObject var __store: Store
    
    @State private var errorTitle = ""
    @State private var isShowingError = false
    
    var onPurchase: (ProductUI) -> Void
    
    var _productUI: ProductUI
    
    func Emoji() -> String {
        return Store.extraTories[0].1
    }
    
    init(productUI: ProductUI, onPurchase: @escaping (ProductUI) -> Void) {
        self.onPurchase = onPurchase
        self._productUI = productUI
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Text(Emoji())
                .font(.system(size: 120))
            Text(_productUI.description)
                .clipShape(Rectangle())
                .padding(10)
                .background(Color.yellow)
                .cornerRadius(10)
                .overlay(
                RoundedRectangle(cornerRadius: 10)
                )
                .padding(.bottom, 5)
                buyButton
                    .buttonStyle(BuyButtonStyle())
        }
                .alert(isPresented: $isShowingError, content: {
                    Alert(title: Text(errorTitle), message: nil, dismissButton: .default(Text("확인")))
                })
        }
    
    var buyButton: some View {
        Button(action: {
            Task {
                await purchase()
            }
        }) {
            Text(_productUI.displayPrice)
                .foregroundColor(.white)
                .bold().font(.system(size: 14))
        }
    }
    
    
        
}
