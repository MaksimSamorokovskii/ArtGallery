//
//  ArtistDetailView.swift
//  ArtGallery
//
//  Created by Максим Самороковский on 17.02.2024.
//

import SwiftUI

struct ArtistDetailView: View {
    let artist: Artist
    @State private var isGalleryFullScreen = false
    @State private var isWorkFullScreen = false
    @State private var selectedWork: Work?

    var body: some View {
        ScrollView {
            VStack {
                if let image = UIImage(named: artist.image) {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                        .onTapGesture {
                            
                            isGalleryFullScreen.toggle()
                        }
                        .allowsHitTesting(true)
                } else {
                    Text("Image not found")
                }

                Text(artist.bio)
                    .padding()

                ForEach(artist.works, id: \.title) { work in
                    VStack(alignment: .leading) {
                        Text(work.title)
                            .font(.headline)
                            .padding([.top, .leading, .trailing], 10)
                        if let image = UIImage(named: work.image) {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding()
                                .onTapGesture {
                                    selectedWork = work
                                    isWorkFullScreen.toggle()
                                }
                                .allowsHitTesting(false)
                        } else {
                            Text("Image not found")
                        }
                        Text(work.info)
                            .font(.subheadline)
                            .padding([.leading, .trailing], 10)
                            .padding(.bottom)
                    }
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .padding(.bottom, 10)
                }
                .navigationTitle(artist.name)
            }
            .padding()
        }
        .fullScreenCover(isPresented: $isGalleryFullScreen) {
            GalleryView(artist: artist)
        }
        .fullScreenCover(isPresented: $isWorkFullScreen) {
            if let selectedWork = selectedWork {
                FullScreenImageView(work: selectedWork)
            } else {
                EmptyView()
            }
        }
    }
}
