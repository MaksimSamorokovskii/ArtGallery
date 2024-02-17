//
//  ArtistsView.swift
//  ArtGallery
//
//  Created by Максим Самороковский on 17.02.2024.
//

import SwiftUI

struct ArtistsView: View {
    @ObservedObject var viewModel = ArtistsViewModel()
    @State private var searchText = ""
    
    var filteredArtists: [Artist] {
        if searchText.isEmpty {
            return viewModel.allArtists.artists
        } else {
            return viewModel.allArtists.artists.filter { artist in
                let artistMatch = artist.name.lowercased().contains(searchText.lowercased())
                let workMatch = artist.works.contains { $0.title.lowercased().contains(searchText.lowercased()) }
                
                return artistMatch || workMatch
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                SearchBar(text: $searchText)
                
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 20) {
                        ForEach(filteredArtists, id: \.name) { artist in
                            NavigationLink(destination: ArtistDetailView(artist: artist)) {
                                HStack(spacing: 15) {
                                    if let image = UIImage(named: artist.image) {
                                        Image(uiImage: image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 100, height: 100)
                                            .cornerRadius(8)
                                    } else {
                                        Text("Image not found")
                                    }
                                    
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(artist.name)
                                            .font(.headline)
                                        Text(artist.bio)
                                            .font(.subheadline)
                                            .lineLimit(2)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .foregroundColor(.primary)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 12)
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding()
                }
                .navigationBarTitle("Artists")
            }
        }
    }
}

struct ArtistsView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistsView()
    }
}
