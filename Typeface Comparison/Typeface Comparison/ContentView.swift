//
//  ContentView.swift
//  Typeface Comparison
//
//  Created by Ezra Bathini on 28/03/20.
//  Copyright © 2020 Ezra Bathini. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    
    enum DragState {
        case inactive
        case active(translation: CGSize)

        var translation: CGSize {
            switch self {
            case .inactive:
                return .zero
            case .active(let t):
                return t
            }
        }

        var isActive: Bool {
            switch self {
            case .inactive: return false
            case .active: return true
            }
        }
    }
    
    
    @State var rotationX: Double
    @State var viewState = CGSize.zero
    @GestureState var dragState = DragState.inactive
    
    
    
    var body: some View {
        
        let gesture = DragGesture().updating($dragState) { (value, dragInfo, _) in
            dragInfo = .active(translation: value.translation)
        }
        
        return VStack {
            ZStack {
                Text("A")
                    .font(.system(size: 400))
                    .foregroundColor(Color.red.opacity(0.6))
                    .fixedSize()
                    .offset(
                        x: viewState.width - CGFloat(rotationX),
                        y: viewState.height
                    )
                Text("A")
                    .font(Font.custom("Futura", size: 400))
                    .foregroundColor(Color.blue.opacity(0.6))
                    .fixedSize()
                    .offset(
                        x: viewState.width + dragState.translation.width + CGFloat(rotationX),
                        y: viewState.height
                    )
                    .gesture(gesture).animation(.spring())
            }
            .shadow(color: Color.black.opacity(0.25), radius: 8, x: 8, y: 8)
            .rotation3DEffect(.degrees(rotationX), axis: (x: 0, y: 1, z: 0))
            Spacer()
            HStack(alignment: .center) {
                Image(systemName: "0.circle")
                Slider(value: $rotationX, in: 0 ... 45)
                    .padding(.horizontal, 10.0)
                Image(systemName: "45.circle")
            }
            .padding(.horizontal, 30.0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(rotationX: 0)
    }
}



