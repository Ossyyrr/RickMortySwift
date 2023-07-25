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
}

 
