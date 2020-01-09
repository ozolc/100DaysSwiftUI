//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Maksim Nosov on 09.01.2020.
//  Copyright © 2020 Maksim Nosov. All rights reserved.
//

import SwiftUI

class User: ObservableObject, Codable {
    @Published var name = "John Rambo"
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}

enum CodingKeys: CodingKey {
    case name
}

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct ContentView: View {
//    @State private var results = [Result]()
    @State private var username = ""
    @State private var email = ""
    
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }

            Section {
                Button("Create account") {
                    print("Creating account…")
                }
            }
//            .disabled(username.isEmpty || email.isEmpty)
            .disabled(disableForm)
        }
    }
    
//    var body: some View {
//        List(results, id: \.trackId) { item in
//            VStack(alignment: .leading) {
//                Text(item.trackName)
//                    .font(.headline)
//                Text(item.collectionName)
//            }
//        }
//        .onAppear(perform: loadData)
//    }
//
//    func  loadData() {
//        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
//            print("Invalid URL")
//            return
//        }
//
//        let request = URLRequest(url: url)
//        URLSession.shared.dataTask(with: request) { data, response, error in
//
//            if let data = data {
//                if let decodeResponse = try? JSONDecoder().decode(Response.self, from: data) {
//                    DispatchQueue.main.async {
//                        self.results = decodeResponse.results
//                    }
//                    return
//                }
//            }
//
//            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
//        }.resume()
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
