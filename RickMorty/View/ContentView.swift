//
//  HomeView.swift
//  RickMorty
//
//  Created by Patricia Manzanero on 25/7/23.
//
import SwiftUI

struct ContentView: View {
    @State private var characters: [Character] = []

    var body: some View {
        NavigationView {
            List(characters) { character in
                VStack(alignment: .leading) {
                    Text(character.name)
                        .font(.headline)
                    Text("Status: \(character.status)")
                    Text("Species: \(character.species)")
                }
            }
            .navigationBarTitle("Rick and Morty Characters")
        }
        .onAppear {
            fetchCharacters()
        }
    }

    func fetchCharacters() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    let characters = try JSONDecoder().decode(APIResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.characters = characters.results
                    }
                } catch {
                    print("Error decoding data: \(error)")
                }
            }
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
