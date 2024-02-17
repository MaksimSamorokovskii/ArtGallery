//
//  NetworkManager.swift
//  ArtGallery
//
//  Created by Максим Самороковский on 17.02.2024.
//

import Foundation

class NetworkManager {
    
    static func fetchArtists(completion: @escaping (AllArtists) -> Void) {
        guard let url = URL(string: "https://file.notion.so/f/f/b8bbfa88-ab7c-464e-8c0e-1c109af93066/8c0c0258-c23a-4229-ae76-b515867cc1d8/artists.json?id=65f3a8fb-a15e-48f4-a7ed-f75be1b2f4fb&table=block&spaceId=b8bbfa88-ab7c-464e-8c0e-1c109af93066&expirationTimestamp=1708228800000&signature=5hy_26eHF9TUrlbLxh1urj8zKsdbIqLJpmXAjMVLP54&downloadName=artists.json") else {
            print("Invalid URL")
            completion(AllArtists(artists: []))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Failed to fetch data:", error?.localizedDescription ?? "Unknown error")
                completion(AllArtists(artists: []))
                return
            }
            
            do {
                let allArtists = try JSONDecoder().decode(AllArtists.self, from: data)
                completion(allArtists)
            } catch {
                print("Error parsing JSON:", error.localizedDescription)
                completion(AllArtists(artists: []))
            }
        }
        
        task.resume()
    }
}
