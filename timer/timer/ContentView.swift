//
//  ContentView.swift
//  timer
//
//  Created by Ezra Bathini on 26/03/20.
//  Copyright © 2020 Ezra Bathini. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var timeCount: Double = 0.0
    
    
    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            self.timeCount += 0.1
        }
    }
    
    var body: some View {
        Color.yellow.overlay(
            VStack(alignment: .center, spacing: 30) {
                Spacer()
                HStack {
                    Group {
                        Text(String(Double(round(1000*timeCount)/1000)))
                            .font(.system(size: 80, weight: .black))
                            .italic()
                            .foregroundColor(Color.white)
                        Text("s")
                        .font(.system(size: 40, weight: .black))
                        .italic()
                        .foregroundColor(Color.white)
                        .padding(.top)
                    }.shadow(color: Color.black.opacity(0.25), radius: 16, x: 0, y: 4)
                    
                }
                Spacer()
                Button(action: {
                    self.timeCount += 1.0
                }) {
                    Text("+1s")
                        .font(.headline)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                }
                .padding(.horizontal, 30.0)
                .padding(.vertical, 10.0)
                .background(Color.green)
                .cornerRadius(5.0)
                 Spacer()
                
            }.onAppear(perform: {
                let _ = self.timer
            })
        ).edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
