//
//  ContentView.swift
//  ReadMe
//
//  Created by wizz on 4/25/21.
//

import SwiftUI

struct ContentView: View {
    @State var library: Library = Library()
    
    var body: some View {
        NavigationView{
            List(library.sortedBooks) { book in
                BookRow(book: book, image: $library.uiImages[book])
            }
            .navigationTitle("My Library")
        }
        
    }
}

struct BookRow: View {
    @ObservedObject var book: Book
    @Binding var image: UIImage?
    
    var body: some View {
        NavigationLink(
            destination: DetailView(book: book, image: $image)){
        HStack {
            Book.Image(uiImage: image, title: book.title, size: 80,cornerRadious: 12)
            VStack(alignment: .leading) {
                TitleAndAuthorStack(book: book, titleFont: .title2, authorFont: .title3)
                if !book.microReview.isEmpty {
                    Spacer()
                    Text(book.microReview)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .lineLimit(1)
            Spacer()
            BookmarkButton(book: book)
                .buttonStyle(BorderlessButtonStyle())
            }
        .padding(.vertical,8)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewedInAllColorSchemes
    }
}

