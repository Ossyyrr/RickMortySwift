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
        VStack(alignment: .leading) {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 150, height: 150)
                .padding()
            
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
