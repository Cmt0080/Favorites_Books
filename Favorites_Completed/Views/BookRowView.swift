//
//  BookRowView.swift
//  Favorites_Completed
//
//  Created by Connor Townsend on 3/29/26.
//
import SwiftUI

struct BookRowView: View {
    
    let book: BookModel
    @EnvironmentObject private var favorites: FavoritesViewModel
    
    var body: some View {
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
            
            Button(action:{
                favorites.toggleFavoriteBook(book: book)
                
            }) {
                Image(systemName: book.isFavorite ? "heart.fill" : "heart")
                    .foregroundStyle(book.isFavorite ? .red : .gray)
                
            }
        }
        .padding(.vertical,4)
    }
}

#Preview {
    BookRowView(book: BookModel(id: 1, bookTitle: "The Lord of the Rings", bookAuthor: "J.R.R. Tolkien"))
        .environmentObject(FavoritesViewModel())
}
