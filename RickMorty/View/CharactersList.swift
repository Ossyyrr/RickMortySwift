//
//  CharactersList.swift
//  RickMorty
//
//  Created by Patricia Manzanero on 25/7/23.
//

import SwiftUI

struct CharactersList: View {
    @StateObject var characterService = CharacterService()
    
    var body: some View {
            NavigationView {
                List(characterService.characters) { character in
                    NavigationLink(destination: CharacterDetail(character: character)) {
                        VStack(alignment: .leading) {
                            Text(character.name)
                                .font(.headline)
                                .onAppear {
                                if character.id == characterService.characters.last?.id {
                                    characterService.fetchCharacters()
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
                characterService.fetchCharacters()
            }
        }
//
//    func fetchCharacters() {
//          guard !isLoading, let url = URL(string: "https://rickandmortyapi.com/api/character/?page=\(currentPage)") else {
//              return
//          }
//
//          isLoading = true
//          URLSession.shared.dataTask(with: url) { data, _, error in
//              if let data = data {
//                  do {
//                      let apiResponse = try JSONDecoder().decode(APIResponse.self, from: data)
//                      DispatchQueue.main.async {
//                          self.characters.append(contentsOf: apiResponse.results)
//                          self.isLoading = false
//                          self.currentPage += 1
//                      }
//                  } catch {
//                      print("Error decoding data: \(error)")
//                      self.isLoading = false
//                  }
//              }
//          }.resume()
//      }
}

struct CharactersList_Previews: PreviewProvider {
    static var previews: some View {
        CharactersList()
    }
}
