//
//  ContentView.swift
//  CatScene
//
//  Created by Ezra Bathini on 29/03/20.
//  Copyright © 2020 Ezra Bathini. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            SceneKitView()
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
    
