//
//  LandmarkDetail.swift
//  Landmark
//
//  Created by choosla on 8/19/25.
//

import SwiftUI

struct LandmarkDetail: View {
  @Environment(ModelData.self) var modelData
  var landmark : Landmark
  
  // 지금 보고 있는 Landmark가 전체 Lanmarks 중에 몇번째를 보고 있는지
  // $0 = it
  var landmarkIndex : Int {
    modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
  }
  var body: some View {
    
    @Bindable var modelData = modelData
    ScrollView {
      MapView(coordinate: landmark.location)
        .frame(height: 300)
      CircleImage(image: landmark.image)
        .offset(y : -130)
        .padding(.bottom,-130)
      VStack(alignment: .leading) {
        HStack{
          Text(landmark.name).font(.title)
          FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
        }
        
        HStack{
          Text(landmark.park).font(.subheadline)
          Spacer()
          Text(landmark.state).font(.subheadline)
        }
        .font(.subheadline)
        .foregroundStyle(.secondary)
        Divider()
        Text("about \(landmark.name)")
          .font(.title2)
        Text(landmark.description)
      }
      .padding()
      
    }
    .navigationTitle(landmark.name)
    .navigationBarTitleDisplayMode(.inline)
  }
}

#Preview {
  LandmarkDetail(landmark : ModelData().landmarks[0])
    .environment(ModelData())
}
