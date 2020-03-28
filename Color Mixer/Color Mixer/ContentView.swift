//
//  ContentView.swift
//  Color Mixer
//
//  Created by Ezra Bathini on 27/03/20.
//  Copyright © 2020 Ezra Bathini. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var red: Double
    @State var green: Double
    @State var blue: Double
   

    fileprivate func getStringValue(_ letter: String,_ double: Double ) -> String {
        return letter + ": " + String(Int(double * 255))
    }
    
    var body: some View {

        ZStack {
            Color(red: red, green: green, blue: blue)
            
            VStack {
                Rectangle().hidden().frame(height: 100)
                HStack {
                    ZStack {
                        Rectangle().frame(height: 100).foregroundColor(Color.white.opacity(0.6)).cornerRadius(20)
                        HStack(alignment: .center, spacing: 30.0) {
                            ColorValueText(text: getStringValue("R", red))
                            ColorValueText(text: getStringValue("G", green))
                            ColorValueText(text: getStringValue("B", blue))
                        }.padding(.all, 30.0)
                    }
                    .padding(.horizontal, 30)
                }
                Rectangle().hidden()
                HStack {
                    ZStack {
                        Rectangle().foregroundColor(.white).cornerRadius(20)
                        VStack(alignment: .center, spacing: 30.0) {
                            HStack(alignment: .center, spacing: 16.0) {
                                Image(systemName: "r.circle").foregroundColor(Color.red.opacity(red + 0.3))
                                Slider(value: $red, in: 0.0 ... 1.0).accentColor(.red)
                                Image(systemName: "r.circle.fill").foregroundColor(.red)
                            }
                            .padding(.horizontal, 20.0)
                            HStack(alignment: .center, spacing: 16.0) {
                                Image(systemName: "g.circle").foregroundColor(Color.green.opacity(green + 0.3))
                                Slider(value: $green, in: 0.0 ... 1.0).accentColor(.green)
                                Image(systemName: "g.circle.fill").foregroundColor(.green)
                            }
                            .padding(.horizontal, 20.0)
                            HStack(alignment: .center, spacing: 16.0) {
                                Image(systemName: "b.circle").foregroundColor(Color.blue.opacity(blue + 0.3))
                                Slider(value: $blue, in: 0.0 ... 1.0).accentColor(.blue)
                                Image(systemName: "b.circle.fill").foregroundColor(.blue)
                            }
                            .padding(.horizontal, 20.0)
                        }.padding(.all, 30.0)
                    }
                    .padding(.horizontal, 30)
                }
                Rectangle().hidden().frame(height: 50)
            }
            
        }.edgesIgnoringSafeArea(.all)
    }
    
       
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(red: 0.5, green: 0.3, blue: 0.5)
    }
}

struct ColorValueText: View {
    let text: String
    var body: some View {
        Text(text).font(.headline).fontWeight(.light)
    }
}
