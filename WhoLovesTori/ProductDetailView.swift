//
//  ProductDetailView.swift
//  WhoLovesTori
//
//  Created by 권유진 on 2022/06/23.
//

import SwiftUI

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(productUI: ProductUI(tuple: Store.extraTories[0]))
            .preferredColorScheme(.light)
        ProductDetailView(productUI: ProductUI(tuple: Store.extraTories[1]))
            .preferredColorScheme(.dark)
        
    }
}

struct ProductDetailView: View {
    
    @EnvironmentObject var __store: Store
    @State private var _isExtraToriShowing = false
    
    @State private var __toriesOffSetX: CGFloat = 0
    @State private var __isToriHidden = false
    @State private var __showExtra = false
    
    let _productUI: ProductUI
    
    var emoji: String {
        return _productUI.emoji
}

    init(productUI: ProductUI, purchasingEnabled: Bool = true) {
        self._productUI = productUI
    }
    
    var body: some View {
        ZStack {
            Group {
                VStack {
                    Text(__showExtra ? "\(emoji)": emoji)
                        .font(.system(size: 120))
                        .padding(.bottom, 20)
                        .offset(x: __toriesOffSetX, y: 0)
                        .opacity(__isToriHidden ? 0.0 : 1.0)
                    Text(_productUI.description)
                        .padding()
                    Spacer()
                }
                extraView
            }
            .blur(radius: _isExtraToriShowing ? 10 : 0)
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation{
                    _isExtraToriShowing = false
                }
            }
            
            
            if _isExtraToriShowing {
                VStack {
                    VBextraPurchaseView()
                    Spacer()
                }
            }
            
        }
    }
    
    var extraView: some View {
        VStack {
            Spacer()
            HStack {
                ExtraSupplyView(_consumedExtra: { extra in extraTories()
                }).padding()
                
                Spacer()
                
                extraStoreButton
                    .padding()
        }
    }
    
    
}
    
    
    @ViewBuilder
    func VBextraPurchaseView() -> some View {
        
        ExtraSupplyView( onPurchase: { extra in withAnimation {
            _isExtraToriShowing = false
        }
            storeConsumable(extra)
        })
            .frame(minWidth: 200, maxWidth: 300)
            .frame(minHeight: 200, maxHeight: 400)
            .background(Color.gray)
            .cornerRadius(15)
            .padding()
        }
    
    var extraStoreButton: some View {
        return Button(action: {
            _isExtraToriShowing = true
        }) {
            Image(systemName: "cart.badge.plus")
                .font(.system(size: 50))
                .padding(5)
        }
    }
    
    fileprivate func storeConsumable(_ purchasedExtra: ProductUI) {
        let availableExtras = UserDefaults.standard.integer(forKey: purchasedExtra.id)
        UserDefaults.standard.set(availableExtras + 1, forKey: purchasedExtra.id)
    }
               
    
    fileprivate func extra() {
        __showExtra = true
        let animationDelay: CGFloat = 0.25
        withAnimation(.spring()) {
            __toriesOffSetX = -UIScreen.main.bounds.size.width
            __isToriHidden = true
            DispatchQueue.main.asyncAfter(deadline: .now() + animationDelay) {
                __toriesOffSetX = UIScreen.main.bounds.size.width
                __isToriHidden = false
                __showExtra = false
                DispatchQueue.main.asyncAfter(deadline: .now() + animationDelay) {
                    withAnimation{
                        __toriesOffSetX = 0
                        
                    }
                }
            }
        }
    }
               
}
