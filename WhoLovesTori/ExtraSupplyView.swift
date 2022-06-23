//
//  ExtraSupplyView.swift
//  WhoLovesTori
//
//  Created by 권유진 on 2022/06/23.
//

import SwiftUI

struct ExtraSupplyView_Previews: PreviewProvider {
    static var previews: some View {
        ExtraSupplyView(_consumedExtra: {_ in })
            .environmentObject(Store())
            .previewLayout(.fixed(width:200, height: 250))
            .preferredColorScheme(.light)
        ExtraSupplyView(_consumedExtra: {_ in })
            .environmentObject(Store())
            .previewLayout(.fixed(width:200, height: 250))
            .preferredColorScheme(.dark)
    }
}

enum ExtraKey: String {
    case moving = "consumable.extra.moving"
    case ofTheDay = "consumable.extra.ofTheDay"
}

struct ExtraSupplyView: View {
    
    @EnvironmentObject var __store: Store
    
    @AppStorage(ExtraKey.moving.rawValue) var __moving = 0
    @AppStorage(ExtraKey.ofTheDay.rawValue) var __ofTheDay = 0
    
    @State var __extrasUI: [ProductUI] = []
    let _consumedExtra: ((ProductUI) -> Void)?
    
    
    var body: some View {
        VStack {
            Text("또다른 토리를 만나요!")
            
            HStack(spacing: 15) {
                ForEach(__extrasUI, id: \.id) { extra in
                    Button(action: {
                        Consume(extra: extra)
                        
                        _consumedExtra?(extra)
                    }) {
                        VStack {
                            let extraAmount = Amount(for: extra)
                            let hasExtra = (extraAmount > 0)
                            VStack {
                                Text(extra.displayName)
                                    .foregroundColor(.black)
                                Text("🎁")
                            }
                            .clipShape(Rectangle())
                            .padding([.leading, .trailing], 15)
                            .padding([.top, .bottom], 5)
                            .background(Color.yellow)
                            .cornerRadius(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.blue, lineWidth: hasExtra ? 2 : 0)
                            )
                            Text("\(extraAmount)")
                        }
                    }
                    .disabled(Amount(for: extra) == 0)
                }
            }
            .onAppear() {
                self.__extrasUI = Store.PreviewProductUIs("extra", 1)
            }
        }
    }
    
    fileprivate func Amount(for extra: ProductUI) -> Int {
        switch extra.id {
        case ExtraKey.moving.rawValue: return __moving
        case ExtraKey.ofTheDay.rawValue: return __ofTheDay
        default: return 0

        }
    }
    
    fileprivate func Consume(extra: ProductUI) {
        switch extra.id {
        case ExtraKey.moving.rawValue:
            if __moving > 0 {
                __moving -= 1
            }
        case ExtraKey.ofTheDay.rawValue:
            if __ofTheDay > 0 {
                __ofTheDay >= 1
            }
        default: return
        }
    }
    
}

