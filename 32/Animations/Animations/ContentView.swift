//
//  ContentView.swift
//  Animations
//
//  Created by Maksim Nosov on 26.12.2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animationAmount = 0.0
    
    var body: some View {
        
        Button("Tap Me") {
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                self.animationAmount += 360
            }
            
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
        
        //        VStack {
        //            Stepper("Scale ammount", value: $animationAmount.animation(
        //                Animation.easeInOut(duration: 1)
        //                .repeatCount(3, autoreverses: true)
        //            ), in: 1...10)
        //
        //            Spacer ()
        //
        //            Button("Tap Me") {
        //                self.animationAmount += 1
        //            }
        //            .padding(40)
        //            .background(Color.red)
        //            .foregroundColor(.white)
        //            .clipShape(Circle())
        //            .scaleEffect(animationAmount)
        //        }
        
        
        //        .overlay(
        //            Circle()
        //                .stroke(Color.red)
        //                .scaleEffect(animationAmount)
        //                .opacity(Double(2 - animationAmount))
        //                .animation(
        //                    Animation.easeInOut(duration: 1)
        //                        .repeatForever(autoreverses: false)
        //            )
        //        )
        //            .onAppear {
        //                self.animationAmount = 2
        //        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
