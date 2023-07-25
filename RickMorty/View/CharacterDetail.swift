//
//  File.swift
//  RickMorty
//
//  Created by Patricia Manzanero on 25/7/23.
//

import SwiftUI

struct CharacterDetail: View {
    let character: Character

    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Image(systemName: "persona.fill")
                .data(url: URL(string: character.image)!)
                .frame(width: 180, height: 180).clipped().clipShape(Circle())
                .frame(width: 180, height: 180).clipped().clipShape(Circle())
            Spacer()
            Text("Name: \(character.name)")
                .font(.title)
            Text("Status: \(character.status)")
            Text("Species: \(character.species)")
            Text("Gender: \(character.gender)")
            
            Spacer()
        }
        .padding()
        .navigationBarTitle(character.name)
    }
}
