//
//  FullScreenImageView.swift
//  ArtGallery
//
//  Created by Максим Самороковский on 17.02.2024.
//

import SwiftUI

struct FullScreenImageView: View {
    let work: Work
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text(work.title)
                .font(.title)
                .padding()

            if let image = UIImage(named: work.image) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            } else {
                Text("Image not found")
            }

            Text(work.info)
                .padding()

            Spacer()

            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark.circle")
                    .foregroundColor(.black)
                    .frame(width: 30, height: 30)
                    .padding()
            }
            .padding(.bottom, 5)
            .padding(.trailing, 10)
        }
    }
}
