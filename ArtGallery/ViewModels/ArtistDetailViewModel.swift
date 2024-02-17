//
//  ArtistDetailViewModel.swift
//  ArtGallery
//
//  Created by Максим Самороковский on 17.02.2024.
//

import SwiftUI

class ArtistDetailViewModel: ObservableObject {
    @Published var artist: Artist
    
    init(artist: Artist) {
        self.artist = artist
    }
}
