//
//  LandmarkList.swift
//  Landmark
//
//  Created by choosla on 8/19/25.
//

import SwiftUI

struct LandmarkList: View {
  @Environment(ModelData.self) var modelData
  @State private var showFavoriteOnly = false
  
  var filteredLandmarks: [Landmark] {
    ModelData().landmarks.filter{ landmark in
      (!showFavoriteOnly || landmark.isFavorite)
    }
  }
  var body: some View {
    NavigationSplitView{
      List(){
        Toggle(isOn : $showFavoriteOnly){
          Text("즐겨찾기만 보기")
        }
        ForEach(filteredLandmarks) {landmark in
          NavigationLink{
            LandmarkDetail(landmark: landmark)
          } label: {
            LandmarkRow(landmark: landmark)
          }
        }
      }
      .animation(.default, value: filteredLandmarks) // 요소가 사라질 때 부드러운 효과
      .navigationTitle("관광명소")
    } detail: {
      Text("관광명소를 선택해주세요")
    }
  }
}

#Preview {
  LandmarkList()
    .environment(ModelData())
}
