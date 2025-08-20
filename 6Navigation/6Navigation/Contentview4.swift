//
//  Contentview4.swift
//  6Navigation
//
//  Created by choosla on 8/19/25.
//

import SwiftUI

struct Contentview4: View {
  @State private var seletctedTab: Int = 0
  
  var body: some View {
    TabView{
      ZStack{
        Color.yellow
        Text("홈화면")
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .tabItem {
        Image(systemName: "house.fill")
        Text("홈")
      }
      .tag(0)
      Text("검색화면")
        .tabItem {
          Image(systemName: "magnifyingglass")
          Text("검색")
        }
        .tag(1)
      Text("설정화면")
        .tabItem {
          Image(systemName: "gearshape")
          Text("설정")
        }
        .tag(2)
    }
    
  }
}

#Preview {
  Contentview4()
}
