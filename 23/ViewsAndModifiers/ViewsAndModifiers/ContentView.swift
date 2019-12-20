//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Maksim Nosov on 20.12.2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content

    var body: some View {
        VStack {
            ForEach(0 ..< rows) { row in
                HStack {
                    ForEach(0 ..< self.columns) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
//        GridStack(rows: 4, columns: 4) { row, col in
//            Text("R\(row) C\(col)")
//        }
        
        GridStack(rows: 4, columns: 4) { row, col in
            HStack {
                Image(systemName: "\(row * 4 + col).circle")
                Text("R\(row) C\(col)")
            }
        }
    }
}

/*
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}

struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            CapsuleText(text: "First")
                .foregroundColor(.white)
            CapsuleText(text: "Second")
                .foregroundColor(.yellow)
            Text("Hello World")
                .modifier(Title())
            Text("Hello World2")
                .titleStyle()
            Color.blue
                .frame(width: 300, height: 200)
                .watermarked(with: "Hacking with Swift")
        }
    }
    
    struct CapsuleText: View {
        var text: String
        
        var body: some View {
            Text(text)
                .font(.largeTitle)
                .padding()
                .background(Color.blue)
                .clipShape(Capsule())
        }
    }
}
*/
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
