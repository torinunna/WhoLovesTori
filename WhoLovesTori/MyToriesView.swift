//
//  MyToriesView.swift
//  WhoLovesTori
//
//  Created by 권유진 on 2022/06/22.
//

import SwiftUI

struct MyToriesView_Previews: PreviewProvider {
    static var previews: some View {
        MyToriesView()
            .preferredColorScheme(.light)
        MyToriesView(false)
            .preferredColorScheme(.dark)
    }
}

struct MyToriesView: View {
    
    @EnvironmentObject var __store: Store
    
    @State var __tories: [ProductUI] = []
    @State var __subs: [ProductUI] = []
    
    let _bBoughtMyTori: Bool
    
    init(_ previewMyTori: Bool = true) {
        self._bBoughtMyTori = previewMyTori
    }
    
    
    var body: some View {
        VStack {
            if __tories.isEmpty && __subs.isEmpty {
                Text("아직 토리가 없어요.")
                    .font(.headline)
                    .padding()
                    .multilineTextAlignment(.center)
                Nav_ShopLink
            } else {
                List {
                    Section(header: Text("My Tories")) {
                        ForEach(__tories, id: \.id) {product in
                            NavigationLink(destination: ProductDetailView(productUI: product)) {
                                ListCellView(productUI: product, purchasingEnabled:  false)
                            }
                        }
                    }
                    
                    Section(header: Text("My Subscriptions")) {
                        ForEach(__subs, id: \.id) {product in
                            NavigationLink(destination: ProductDetailView(productUI: product)) {
                                ListCellView(productUI: product, purchasingEnabled:  false)
                            }
                        }
                    }
                }
            }
            
            Button("토리 불러오기", action: {
                
            })
        }
        .navigationTitle("My Tories")
        .onAppear {
            if _bBoughtMyTori {
                self.__tories = Store.PreviewProductUIs("Tories", 1)
                self.__subs = Store.PreviewProductUIs("subscriptions", 1)
            }
        }
    }

    var Nav_ShopLink: some View {
        let shopView = StoreView()
        return NavigationLink(destination: shopView) {
            Text("\(Image(systemName: "cart")) Shop")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.blue)
                .cornerRadius(15.0)
        }
    }
    
    
        
    }
    
    
    
