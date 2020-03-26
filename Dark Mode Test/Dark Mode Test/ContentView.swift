//
//  ContentView.swift
//  Dark Mode Test
//
//  Created by Ezra Bathini on 26/03/20.
//  Copyright © 2020 Ezra Bathini. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        ZStack {
            Color(UIColor(named: "accentColor")!).edgesIgnoringSafeArea(.all)
            HStack {
                VStack(alignment: .leading) {
                    Text("Now, is")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color(UIColor(named: "labelColor")!))
                        .multilineTextAlignment(.leading)
                    Text(colorScheme == .light ? "Light" : "Dark")
                        .font(Font.custom("Condiment-Regular", size: 98))
                        .padding(.trailing, 13.0).multilineTextAlignment(.leading)
                }
                .padding(.trailing)
                Spacer()
            }
            .padding(.horizontal, 20.0)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().environment(\.colorScheme, .dark)
            ContentView().environment(\.colorScheme, .light)
        }
    }
}
