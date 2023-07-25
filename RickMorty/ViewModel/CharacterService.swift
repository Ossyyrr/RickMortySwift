//
//  CharacterService.swift
//  RickMorty
//
//  Created by Patricia Manzanero on 25/7/23.
//

import Foundation

class CharacterService : ObservableObject {
 
    
    @Published  var characters: [Character] = []
    @Published  var isLoading = false
    @Published  var currentPage = 1
    
    init(){
        fetchCharacters()
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
