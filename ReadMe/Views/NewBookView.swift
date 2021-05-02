//
//  NewBookView.swift
//  ReadMe
//
//  Created by wizz on 5/2/21.
//

import SwiftUI

struct NewBookView: View {
    @ObservedObject var book = Book(title: "", author: "")
    @EnvironmentObject var library: Library
    @Environment(\.presentationMode) var presentationMode
    
    @State var image: UIImage? = nil
    var body: some View {
        NavigationView{
            VStack(alignment: .center, spacing: 24) {
                TextField("Title", text: $book.title)
                TextField("Author", text: $book.author)
                ReviewAndImageStack(book: book, image: $image)
            }
            .padding()
            .navigationBarTitle("Got a new book?")
            .toolbar{
                ToolbarItem(placement: .status){
                    Button{
                        library.addNewBook(book, image: image)
                        presentationMode.wrappedValue.dismiss()
                    }label:{
                        Text("Add to list")
                    }
                    .disabled(
                        [book.title, book.author].contains(where: \.isEmpty)
                    )
                }
            }
        }
    }
    
}

struct NewBookView_Previews: PreviewProvider {
    static var previews: some View {
        NewBookView().environmentObject(Library())
    }
}
