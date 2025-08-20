//
//  ContentView3.swift
//  5ForEach&LazyVStack
//
//  Created by choosla on 8/19/25.
//

import SwiftUI

struct Movie : Identifiable{
    let id = UUID()
    let title : String
}

struct ContentView3: View {
    let movies1 = [
        Movie(title: "로맨스가 너무해"),
        Movie(title:"라라랜드"),
        Movie(title:"노트북")
    ]
    let movies2 = [
        Movie(title:"범죄도시"),
        Movie(title:"신세게"),
        Movie(title:"타짜"),
        Movie(title:"친구")
    ]
    
    var body: some View {
        List{
            Section(header : Text("로맨스").font(.headline)){
                ForEach(movies1){ movie in
                    HStack{
                        Image(systemName: "book.fill")
                            .foregroundColor(.blue)
                        Text(movie.title)
                    }
                }

            }
          
            Section(header : Text("느와르").font(.headline)){
                ForEach(movies2){ movie in
                    HStack{
                        Image(systemName: "book.fill")
                            .foregroundColor(.blue)
                        Text(movie.title)
                    }
                }

            }
            
        }
//        .listStyle(PlainListStyle())
    }
}

#Preview {
    ContentView3()
}
