//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Maksim Nosov on 18.12.2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    @State private var flagAngle = [0.0, 0.0, 0.0]
    @State private var flagOpacity = [1.0, 1.0, 1.0]
    @State private var flagBlur: [CGFloat] = [0, 0, 0]
    
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            
            VStack (spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                        .fixedSize(horizontal: true, vertical: false)
                    
                    Text(countries[correctAnswer])
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .foregroundColor(.white)
                        .fixedSize(horizontal: true, vertical: false)
                }
                
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        // flag was tapped
                        self.flagTapped(number)
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2)
                            .rotation3DEffect(.degrees(self.flagAngle[number]), axis: (x: 0, y: 1, z: 0))
                            .opacity(self.flagOpacity[number])
                            .blur(radius: self.flagBlur[number])
                            .animation(.default)
                    }
                }
                
                Text("Current score: \(score)")
                    .foregroundColor(.white)
                Spacer()
            }
            .alert(isPresented: $showingScore) {
                Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
                    self.askQuestion()
                })
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            correctAnimation()
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
            score == 0 ? score = 0 : (score = score - 1)
            wrongAnimation()
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        flagAngle = [0.0, 0.0, 0.0]
        flagOpacity = [1.0, 1.0, 1.0]
        flagBlur = [0, 0, 0]
    }
    
    func correctAnimation() {
        for flag in 0...2 {
            if flag == correctAnswer {
                flagAngle[flag] = 360.0
            } else {
                flagOpacity[flag] = 0.25
            }
        }
    }
    
    func wrongAnimation() {
        for flag in 0...2 {
            if flag != correctAnswer {
                flagBlur[flag] = 6
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
