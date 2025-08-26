//
//  CreateVoteView.swift
//  Clazzi
//
//  Created by choosla on 8/26/25.
//

import SwiftUI

struct CreateVoteView: View {
  @State private var title: String = ""
  @State private var options: [String] = ["",""]
    var body: some View {
      NavigationStack{
        VStack(alignment: .leading){
          TextField("투표 제목", text: .constant(""))
            .padding()
            .background(
              RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1)
            )
            .padding(.bottom, 32)
          
          Text("투표 항목")
            .font(.headline)
          
          TextField("항목 1", text: .constant(""))
            .padding()
            .background(
              RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1)
            )
          
          TextField("항목 2", text: .constant(""))
            .padding()
            .background(
              RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1)
            )
          
          Button("항목 추가"){
            
          }
          .buttonStyle(.bordered)
          .frame(maxWidth: .infinity, alignment: .trailing)
          
          Spacer()
          
          Button(action: {}) {
            Text("생성 하기")
              .frame(maxWidth:.infinity)
              .padding()
              .background(.blue)
              .foregroundColor(.white)
              .cornerRadius(8)
          }
        }
        .padding()
        .navigationTitle(Text("투표 생성 화면"))
      }
    }
}

#Preview {
    CreateVoteView()
}
