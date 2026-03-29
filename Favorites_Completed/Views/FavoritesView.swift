//
//  FavoritesView.swift
//  Favorites_Completed
//
//  Created by Connor Townsend on 3/29/26.
//
import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject var favorites: FavoritesViewModel
    
    var favoritedCities: [CityModel] {
        favorites.cities.filter { $0.isFavorite }
    }
    var favoritedHobbies: [HobbyModel] {
        favorites.hobbies.filter { $0.isFavorite }
    }
    var favoritedBooks: [BookModel] {
        favorites.books.filter { $0.isFavorite }
    }
    
    var body: some View {
        NavigationStack {
            List {
                if !favoritedCities.isEmpty {
                    Section("Cities") {
                        ForEach(favoritedCities) { city in
                            HStack {
                                Text("🏙️")
                                    .font(.title2)
                                Text(city.cityName)
                                Spacer()
                                Button(action: {
                                    favorites.toggleFavoriteCity(city: city)
                                }) {
                                    Image(systemName: "heart.fill")
                                        .foregroundStyle(.red)
                                }
                            }
                        }
                    }
                }
                
                if !favoritedHobbies.isEmpty {
                    Section("Hobbies") {
                        ForEach(favoritedHobbies) { hobby in
                            HStack {
                                Text(hobby.hobbyIcon)
                                    .font(.title2)
                                Text(hobby.hobbyName)
                                Spacer()
                                Button(action: {
                                    favorites.toggleFavoriteHobby(hobby: hobby)
                                }) {
                                    Image(systemName: "heart.fill")
                                        .foregroundStyle(.red)
                                }
                            }
                        }
                    }
                }
                
                if !favoritedBooks.isEmpty {
                    Section("Books") {
                        ForEach(favoritedBooks) { book in
                            HStack {
                                Text("📖")
                                    .font(.title2)
                                VStack(alignment: .leading) {
                                    Text(book.bookTitle)
                                        .font(.body)
                                    Text(book.bookAuthor)
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                                Spacer()
                                Button(action: {
                                    favorites.toggleFavoriteBook(book: book)
                                }) {
                                    Image(systemName: "heart.fill")
                                        .foregroundStyle(.red)
                                }
                            }
                        }
                    }
                }
                
                if favoritedCities.isEmpty && favoritedHobbies.isEmpty && favoritedBooks.isEmpty {
                    ContentUnavailableView("No Favorites Yet", systemImage: "heart", description: Text("Tap the heart on any city, hobby, or book to save it here."))
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

#Preview {
    FavoritesView()
        .environmentObject(FavoritesViewModel())
}

