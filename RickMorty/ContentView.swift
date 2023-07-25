//
//  ContentView.swift
//  RickMorty
//
//  Created by Patricia Manzanero on 25/7/23.
//

import SwiftUI

struct APIResponse: Codable {
    let results: [Character]
}



struct ContentView: View {
    @State private var characters: [Character] = []
    @State private var isLoading = false
    @State private var currentPage = 1
    
    var body: some View {
            NavigationView {
                List(characters) { character in
                    NavigationLink(destination: CharacterDetail(character: character)) {
                        VStack(alignment: .leading) {
                            Text(character.name)
                                .font(.headline)
                                .onAppear {
                                if character.id == self.characters.last?.id {
                                    fetchCharacters()
                                }
                            }
                            Text("Status: \(character.status)")
                            Text("Species: \(character.species)")
                        }
                    }
                }
                .navigationBarTitle("Rick and Morty Characters")
            }
            .onAppear {
                fetchCharacters()
            }
        }

    func fetchCharacters() {
          guard !isLoading, let url = URL(string: "https://rickandmortyapi.com/api/character/?page=\(currentPage)") else {
              return
          }

          isLoading = true
          URLSession.shared.dataTask(with: url) { data, _, error in
              if let data = data {
                  do {
                      let apiResponse = try JSONDecoder().decode(APIResponse.self, from: data)
                      DispatchQueue.main.async {
                          self.characters.append(contentsOf: apiResponse.results)
                          self.isLoading = false
                          self.currentPage += 1
                      }
                  } catch {
                      print("Error decoding data: \(error)")
                      self.isLoading = false
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
