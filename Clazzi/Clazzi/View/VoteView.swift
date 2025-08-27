//
//  ContentView.swift
//  Clazzi
//
//  Created by choosla on 8/26/25.
//

import SwiftUI

struct VoteView: View {
  @Environment(\.dismiss) private var dismiss
  
  //  let options = ["김치찌개", "돈까스"]
  @State private var selectedOption: Int = 0
  
  //  let vote: String
  
  let vote: Vote
  
  var body: some View {
    NavigationStack {
      VStack {
        Spacer()
        
        Text(vote.title)
          .font(.title2)
          .fontWeight(.bold)
          .padding(.bottom)
        
        ForEach(vote.options.indices, id:\.self){ index in
          Button(action:{
            selectedOption = index
          }){
            Text(vote.options[index].name)
              .frame(maxWidth: 200)
              .padding()
              .background(index == selectedOption ? Color.green : Color.gray.opacity(0.5))
              .foregroundColor(.white)
              .clipShape(.capsule)
          }
        }
        
        Spacer()
        
        Button(action:{
          print("투표 항목은 \(vote.options[selectedOption])입니다")
          dismiss()
        }){
          Text("투표하기")
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
      }
      .navigationTitle(Text("투표 화면"))
      .padding()
    }
  }
}

#Preview {
  VoteView(vote: Vote(title: "오늘 점심 메뉴 추천", options: [
    VoteOption(name: "옵션1"),
    VoteOption(name: "옵션1")
  ]))
}
