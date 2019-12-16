//
//  ContentView.swift
//  WeSplit
//
//  Created by Maksim Nosov on 16.12.2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    @State private var name = ""
    
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(0 ..< students.count) {
                        Text(self.students[$0])
                    }
                }
                Text("You chose: Student # \(students[selectedStudent])")
            }
                //            Form {
                //                ForEach(0 ..< 100) { number in
                //                    Text("Row \(number)")
                //                }
                //            }
                //            Form {
                //                Section {
                //                    TextField("Enter your name", text: $name)
                //                    Text("Your name is \(name)")
                //                }
                //                Button("Tap Count: \(tapCount)") {
                //                    self.tapCount += 1
                //                }
                //            }
                .navigationBarTitle("SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
