//
//  CategoryItem.swift
//  Landmark
//
//  Created by choosla on 8/19/25.
//

import SwiftUI

struct CategoryItem: View {
  var landmark: Landmark
    var body: some View {
      VStack(alignment: .leading) {
        landmark.image
          .resizable()
          .frame(width : 155, height: 155)
        Text(landmark.name)
          .font(.caption)
      }
      .padding(.leading, 15)
    }
}

#Preview {
  CategoryItem(landmark: ModelData().landmarks.first!)
}
