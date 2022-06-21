//
//  ContentView.swift
//  WhoLovesTori
//
//  Created by 권유진 on 2022/06/21.
//

import SwiftUI

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack {
                    Text("In App Purchase")
                        .bold().foregroundColor(.indigo)
                        .font(.system(size: 35))
                    Text("StoreKit II").font(.title)
                        .padding(.bottom, 10)
                    Text("Preview & UI").font(.title2)
                        .foregroundColor(.red)
                    VStack(spacing: 10) {
                        Text("🐶")
                            .font(.system(size: 120))
                            .padding(.bottom, 15)
                        
                        navShopLink
                        myToriLink
                    }
                }
            }
        }
    }

var navShopLink: some View {
//    let nvl = NavigationLink(destination: StoreView) {
        Text("\(Image(systemName: "cart")) Shop")
            .font(.headline).foregroundColor(.white)
            .padding()
            .frame(width: 300, height: 40)
            .background(Color.blue).cornerRadius(15.0)
//    }
//    return nvl
    }
    
var myToriLink: some View {
//        NavigationLink(destination: myCarsView()) {
        Text("\(Image(systemName: "photo")) My Tories")
                .font(.headline).foregroundColor(.white)
                .padding()
                .frame(width: 300, height: 40)
                .background(Color.blue).cornerRadius(15.0)
//        }
    }

}
