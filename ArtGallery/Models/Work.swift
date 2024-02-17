//
//  Work.swift
//  ArtGallery
//
//  Created by Максим Самороковский on 17.02.2024.
//

import Foundation

struct Work: Codable, Identifiable {
    let id = UUID()
    let title, image, info: String
}
