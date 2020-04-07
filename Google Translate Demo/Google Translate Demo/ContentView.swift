//
//  ContentView.swift
//  Google Translate Demo
//
//  Created by Ezra Bathini on 7/04/20.
//  Copyright © 2020 Ezra Bathini. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var text: String = ""
    @State var targetText: String = ""
    @State var isEditing: Bool = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.yellow)
                .edgesIgnoringSafeArea(.all)
            VStack {
                TextField(text != "" ? "" : "Enter text..", text: $text, onCommit: {
                    SwiftGoogleTranslate.shared.translate(self.text, "hi", "en") { (text, err) in
                         if let t = text, err == nil {
                            self.targetText = t
                        }
                    }
                })
                .font(.system(size: 34, weight: .bold))
                .accentColor(Color.black)
                .multilineTextAlignment(.center)
                .onTapGesture {
                    self.isEditing.toggle()
                }
                .frame(height: 100)
                .padding()
                Button(action: {
                    SwiftGoogleTranslate.shared.translate(self.text, "hi", "en") { (text, err) in
                         if let t = text, err == nil {
                            self.targetText = t
                        }
                    }
                }) {
                    Image(systemName: targetText == "" || text == ""  ? "chevron.right.circle" : "chevron.up.chevron.down")
                        .font(.system(size: 34, weight: .bold))
                        .accentColor(.black)
                    .frame(width: 100, height: 100)
                    
                }
                Text(targetText == "" || text == "" ? "🇮🇳" : "\(targetText)")
                    .font(.system(size: 32, weight: .bold))
                    .accentColor(.black)
                    .multilineTextAlignment(.center)
                    .padding()
                    .animation(.spring())
                Spacer()
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
