//
//  VoteView.swift
//  MVVMStudy2
//
//  Created by choosla on 8/29/25.
//

import SwiftUI

struct VoteView: View {
  @State var text: String = "원래 텍스트"
  @State var vote: Vote = Vote(title: "구조체 Vote 원래 텍스트")
  @StateObject var viewModel = VoteViewModel()
  
  var body: some View {
    NavigationStack {
      VStack{
        Text(text)
        Text(vote.title)
        Text(viewModel.vote.title)
        
        Button("텍스트들 바꾸기"){
          vote.title = "구조체 Vote 새로운 텍스트"
          text = "새로운 텍스트"
          viewModel.vote.title = "ViewModel 새로운 텍스트"
        }
      }.padding()
      
      ChildView(text: $text, viewModel: viewModel)
        .padding()
      
      NavigationLink("SecondView로 이동"){
        SecondView(text: $text, viewModel: viewModel)
      }
    }
  }
}

struct ChildView: View{
  @Binding var text: String
  @ObservedObject var viewModel: VoteViewModel
  
  var body: some View{
    VStack {
      Text(text)
      Text(viewModel.vote.title)
      Button("바꾸기"){
        text = "CildView 새로운 텍스트"
        viewModel.vote.title = "ChildView 새로운 텍스트"
      }
    }
    
  }
}

struct SecondView: View{
  @Binding var text: String
  @ObservedObject var viewModel: VoteViewModel
  
  var body: some View{
    Text(text)
    Text(viewModel.vote.title)
    Button("바꾸기"){
      text = "SecondView 새로운 텍스트"
      viewModel.vote.title = "SecondView 새로운 텍스트"
    }
  }
}

#Preview {
  VoteView()
}
