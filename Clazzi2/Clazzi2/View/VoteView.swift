//
//  ContentView.swift
//  Clazzi2
//
//  Created by choosla on 8/26/25.
//

import SwiftUI

struct VoteView: View {
  
  @State private var selectedOption: Int = 0
  @State private var options: [String] = ["김치찌개","돈까스"]
  
  var body: some View {
    NavigationStack {
      Spacer()
      VStack{
        Text("점메추 무엇??")
          .font(.title3)
          .fontWeight(.bold)
        
        ForEach(options.indices, id: \.self){ index in
          Button(action: {
            selectedOption = index
          }) {
            Text(options[index])
              .padding()
              .frame(maxWidth: 200)
              .foregroundColor(.white)
              .background(index == selectedOption ? .green : .gray.opacity(0.5))
              .clipShape(.capsule)
          }
        }
      }.navigationBarTitle(Text("투표 화면"))
      
      Spacer()
      
      Button(action: {}){
        Text("투표하기")
          .padding()
          .frame(maxWidth: .infinity)
          .foregroundColor(.white)
          .background(.blue)
          .clipShape(RoundedRectangle(cornerRadius: 8))
      }.padding()
    }
  }
}

#Preview {
  VoteView()
}
