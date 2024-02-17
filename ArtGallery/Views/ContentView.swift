//
//  ContentView.swift
//  ArtGallery
//
//  Created by Максим Самороковский on 17.02.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ArtistsViewModel()
    
    var body: some View {
        ArtistsView(viewModel: viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
