//
//  CreateVoteView.swift
//  Clazzi2
//
//  Created by choosla on 8/26/25.
//

import SwiftUI

struct CreateVoteView: View {
  @State private var title: String = ""
  @State private var options: [String] = ["", ""]
  var body: some View {
    NavigationStack{
      VStack {
        ScrollView {
          VStack(alignment: .leading){
            TextField("투표 제목", text: $title)
              .padding()
              .background(
                RoundedRectangle(cornerRadius: 8)
                  .stroke(Color.gray,lineWidth: 1)
              )
              .padding(.bottom, 32)
            
            Text("투표 항목")
            ForEach(options.indices, id:\.self){ index in
              TextField("항목 \(index + 1)", text: $options[index])
                .padding()
                .background(
                  RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray,lineWidth: 1)
                )
            }
            
            HStack{
              Spacer()
              Button(action: {
                options.append("")
              }){
                Text("항목 추가")
              }.buttonStyle(.bordered)
            }
          }
          .padding()
          .navigationTitle(Text("투표 생성 화면"))
        }
        Spacer()
        
        Button(action: {}){
          Text("생성하기")
            .frame(maxWidth: .infinity)
            .padding()
            .background(.gray)
            .foregroundColor(.white)
            .cornerRadius(12)
        }
        .padding()
        
      }

    }
  }
}

#Preview {
  CreateVoteView()
}
