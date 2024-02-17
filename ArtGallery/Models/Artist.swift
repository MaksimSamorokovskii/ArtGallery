//
//  Artist.swift
//  ArtGallery
//
//  Created by Максим Самороковский on 17.02.2024.
//

import Foundation

struct Artist: Codable {
    let name, bio, image: String
    let works: [Work]
}
