//
//  ExtraStoreView.swift
//  WhoLovesTori
//
//  Created by 권유진 on 2022/06/23.
//

import SwiftUI

struct ExtraStoreView_Previews: PreviewProvider {
    static var previews: some View {
        ExtraStoreView()
            .previewLayout(.fixed(width: 350, height: 350))
            .environmentObject(Store())
        ExtraStoreView()
            .previewLayout(.fixed(width: 350, height: 350))
            .environmentObject(Store())
    }
}


struct ExtraStoreView: View {
    var body: some View {
        
        @EnvironmentObject var __store: Store
        
        var onPurchase: (ProductUI) -> Void
        
        @State var _extrasUI: [ProductUI] = []
            
        init() {
                self.onPurchase = { extra in }
        }
        
        init(onPurchase: @escaping (ProductUI) -> Void) {
            self.onPurchase = onPurchase
        }
    
        var body: some View {
            VStack {
                Text("토리를 더 많이 만날 수 있어요 :)")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                HStack {
                    ForEach(_extrasUI, id: \.id) { extra in
                        ExtraProductView(ProductUI: extra, onPurchase: onPurchase)
                    }
                }
            }
            .onAppear {
                self.__extrasUI = Store.PreviewProductUIs("extra", 1)
            }
        }
            
            
        
    }
}

