//
//  ContentView.swift
//  BetterRest
//
//  Created by Maksim Nosov on 22.12.2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date()
    
    var body: some View {
        //        Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
        //            Text("\(sleepAmount, specifier: "%.2g") hours")
        //        }
        DatePicker("Please enter a date", selection: $wakeUp, in: Date()...)
            .labelsHidden()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
