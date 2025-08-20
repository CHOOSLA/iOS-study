//
//  ContentView2.swift
//  5ForEach&LazyVStack
//
//  Created by choosla on 8/19/25.
//

import SwiftUI

struct Fruit2: Identifiable{
    let id = UUID()
    
    let name : String
    let imageName : String
}


struct ContentView2: View {
    let fruits = ["사과", "바나나","오렌지"]
    var body: some View {
        //        List{
        //            Section{
        //                Text("아이템1")
        //            }
        //            Section{
        //                Text("아이템2")
        //                Text("아이템3")
        //            }
        //            Section(header: Text("테스트")){
        //                Text("아이템4")
        //                Text("아이템5")
        //            }
        //        }
        
        //        List(fruits, id: \.self){ fruit in
        //            Text(fruit)
        //        }
        
        let fruits = [
            Fruit2(name: "사과", imageName: "applelogo"),
            Fruit2(name: "바나나", imageName: "leaf"),
            Fruit2(name: "오렌지", imageName: "sun.max.fill")
        ]
        
        
        ForEach(fruits){ fruit in
            HStack{
                Image(systemName: fruit.imageName)
                Text(fruit.name)
            }
        }
    }
}

#Preview {
    ContentView2()
}
