//
//  LandmarkRow.swift
//  Landmark
//
//  Created by Admin on 8/18/25.
//

import SwiftUI

struct LandmarkRow: View {
  var landmark: Landmark
  var body: some View {
    HStack{
      landmark.image
        .resizable()
        .frame(width: 50, height: 50)
      Text(landmark.name)
      Spacer()
      
      if(landmark.isFavorite){
        Image(systemName: "star.fill")
          .foregroundStyle(.yellow)
      }
      
    }
    
  }
  
}

#Preview("그룹"){
  Group{
    LandmarkRow(landmark: ModelData().landmarks[0])
    LandmarkRow(landmark: ModelData().landmarks[1])
  }
}

#Preview("N서울타워") {
  LandmarkRow(landmark: ModelData().landmarks[0])
}

#Preview("경복궁") {
  LandmarkRow(landmark: ModelData().landmarks[1])
}

