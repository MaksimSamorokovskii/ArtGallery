//
//  GalleryView.swift
//  ArtGallery
//
//  Created by Максим Самороковский on 17.02.2024.
//

import SwiftUI

struct GalleryView: View {
    let artist: Artist
    @State private var selectedWork: Work?
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(artist.works, id: \.title) { work in
                    VStack(alignment: .leading) {
                        Text(work.title)
                            .font(.headline)
                        if let image = UIImage(named: work.image) {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding()
                                .onTapGesture {
                                    selectedWork = work
                                }
                        } else {
                            Text("Image not found")
                        }
                        Text(work.info)
                            .font(.subheadline)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                }
            }
            .padding()
        }
        .fullScreenCover(item: $selectedWork) { work in
            FullScreenImageView(work: work)
        }
        .overlay(
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark.circle")
                    .foregroundColor(.black)
                    .padding()
            }
            .padding(.bottom, 5)
            .padding(.trailing, 10)
            ,alignment: .bottomTrailing
        )
    }
}
