//
//  CategoryHome.swift
//  Landmark
//
//  Created by choosla on 8/19/25.
//

import SwiftUI

struct CategoryHome: View {
  @Environment(ModelData.self) var modelData
  
    var body: some View {
      NavigationSplitView{
        List{
          modelData.features[0].image
            .resizable()
            .scaledToFill()
            .frame(height: 200)
            .clipped()
            .listRowInsets(EdgeInsets())
          ForEach(modelData.categories.keys.sorted(), id: \.self){ key in
            CategoryRow(categoryName: key, items: modelData.categories[key]!)
          }
          .listRowInsets(EdgeInsets())
        }
      } detail: {
        Text("관광명소를 선택하세요")
      }
    }
}

#Preview {
    CategoryHome()
    .environment(ModelData())
}
