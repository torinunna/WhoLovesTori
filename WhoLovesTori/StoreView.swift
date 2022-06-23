//
//  StoreView.swift
//  WhoLovesTori
//
//  Created by 권유진 on 2022/06/22.
//

import SwiftUI

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
            .environmentObject(Store())
            .preferredColorScheme(.light)
        StoreView()
            .environmentObject(Store())
            .preferredColorScheme(.dark)
    }
}

struct StoreView: View {
    
    @EnvironmentObject var __store: Store
    
    @State var __tories: [ProductUI] = []
    @State var __subsPrdUI: ProductUI?
    @State var __subs: [ProductUI] = []
    
    var body: some View {
        
        List {
            Section(header: Text("Tories")) {
                ForEach(self.__tories, id: \.id) { Tori in
                    ListCellView(productUI: Tori)
                }
            }.listStyle(GroupedListStyle())
        
            Section(header: Text("My Subscription")) {
                ListCellView(productUI: ProductUI(tuple: Store.subscriptions[1]))
                Text("Subscription Preview string test.")
                    .multilineTextAlignment(.center)

            }
            
            Section(header: Text("Susbscription Options \(self.__subs.count)")) {
                ForEach(self.__subs, id: \.id) {product in
                    ListCellView(productUI: product, purchasingEnabled: true)
                }
            }
            
        }
        .navigationTitle("구독하기")
        .onAppear {
            self.__tories = Store.PreviewProductUIs("tories", 2)
            self.__subs = Store.PreviewProductUIs("Subsciptions", 3)
        }
    }
}
