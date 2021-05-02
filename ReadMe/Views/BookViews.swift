//
//  BookViews.swift
//  ReadMe
//
//  Created by wizz on 4/25/21.
//

import SwiftUI

struct BookmarkButton: View {
    @ObservedObject var book: Book
    var body: some View {
        let bookmark = "bookmark"
        Button{
            book.readMe.toggle()
        }label: {
            Image(systemName: book.readMe ? "\(bookmark).fill" : bookmark)
                .font(.system(size: 48, weight: .light))
        }
    }
}

struct TitleAndAuthorStack: View {
    let book: Book
    let titleFont: Font
    let authorFont: Font
    
    var body: some View {
        VStack(alignment: .leading){
            Text(book.title)
                .font(titleFont)
            Text(book.author)
                .font(authorFont)
                .foregroundColor(.secondary)
        }
        
    }
}

extension Book {
    struct Image: View {
        
        let uiImage: UIImage?
        let title: String
        var size: CGFloat?
        let cornerRadious: CGFloat
        
        var body: some View {
            if let image = uiImage.map(SwiftUI.Image.init) {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: size, height: size)
                    .cornerRadius(cornerRadious)
            }else{
                let symbol = SwiftUI.Image(title: title) ?? .init(systemName: "book")
                    
                    symbol
                    .resizable()
                    .scaledToFit()
                    .frame(width: size, height: size)
                    .font(Font.title.weight(.light))
                    .foregroundColor(.secondary)
            }
            
        }
    }
}

struct Book_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HStack{
                BookmarkButton(book: .init())
                BookmarkButton(book: .init(readMe: false))
                TitleAndAuthorStack(book: Book.init(), titleFont: .title2, authorFont: .title3)
            }
            Book.Image(title: Book().title)
            Book.Image(title: "")
            Book.Image(title: "🤠")
            }.previewedInAllColorSchemes
    }
}

extension Book.Image {
    ////A preview Image
    init(title: String){
        self.init(
            uiImage: nil,
            title: title, cornerRadious: .init()
        )
    }
}

extension Image {
    init?(title: String){
        guard let character = title.first,
        case let symbolName = "\(character.lowercased()).square",
        UIImage(systemName: symbolName) != nil else {
            return nil
        }
        self.init(systemName: symbolName)
    }
}

extension View{
    var previewedInAllColorSchemes: some View {
        ForEach(ColorScheme.allCases, id: \.self, content: preferredColorScheme)
    }
}
