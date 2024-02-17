//
//  ArtistsViewModel.swift
//  ArtGallery
//
//  Created by Максим Самороковский on 17.02.2024.
//

import SwiftUI

class ArtistsViewModel: ObservableObject {
    @Published var allArtists: AllArtists = AllArtists(artists: [])
    
    init() {
        loadArtists()
    }
    
    func loadArtists() {
        NetworkManager.fetchArtists { allArtists in
            DispatchQueue.main.async {
                self.allArtists = allArtists
            }
        }
    }
}
