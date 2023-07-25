//
//  ImageExtension.swift
//  RickMorty
//
//  Created by Patricia Manzanero on 25/7/23.
//

import Foundation
import SwiftUI

extension Image {
    func data(url: URL) -> Self {
        if let data = try? Data(contentsOf: url){
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        return self
            .resizable()
    }
}
