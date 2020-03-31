//
//  ContentView.swift
//  Text Field Animation
//
//  Created by Ezra Bathini on 1/04/20.
//  Copyright © 2020 Ezra Bathini. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var someText: String = ""

    
    var body: some View {
        ZStack {
            Rectangle().foregroundColor(.yellow).edgesIgnoringSafeArea(.all)
            VStack {
                Group {
                    TextField("Say something...", text: $someText)
                        .font(.system(size: 32, weight: .black))
                        .foregroundColor(.black)
                        .accentColor(.blue)
                        .padding(.all, 32)
                        .background(someText != "" ? Color.yellow.frame(width: 0, height: 0).offset(x: 64.0 - (UIScreen.main.bounds.size.width / 2.0)) : Color.blue.frame(width: nil, height: nil).offset(x: 0))
                    .cornerRadius(16)
                        .animation(.spring(response: 1.0))
                }
                .padding(.horizontal, 32)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
