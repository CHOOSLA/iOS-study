//
//  ContentView.swift
//  MVVMStudy
//
//  Created by choosla on 8/29/25.
//

import SwiftUI

struct VoteListView: View {
  @StateObject private var viewModel = VoteListViewModel()
  @State private var showingEditorCreate = false
  @State private var showingEditorEdit = false
  
  @State private var voteForEdit: Vote?
  var body: some View {
    NavigationStack{
      List{
        ForEach(viewModel.getVotes()){ vote in
          HStack {
            Text(vote.title)
            Spacer()
            Button(action: {
              print(vote.title)
              voteForEdit = vote
              showingEditorEdit = true
            }){
              Image(systemName: "pencil")
            }
          }
        }
      }
      .navigationTitle("투표 목록")
      .toolbar{
        ToolbarItem(){
          Button(action : {
            
            showingEditorCreate = true
//            viewModel.addVote(Vote(id: UUID(), title: "새로운 투표", options: ["항목1"]))
          }){
            Image(systemName: "plus")
          }
        }
      }
      .sheet(isPresented: $showingEditorCreate) {
        VoteEditorView(viewModel: VoteEditorViewModel()) { newVote in
//          if let vote = newVote{
//            viewModel.addVote(vote)
//          }
          print("VoteListView에 해당 Vote를 추가")
          viewModel.addVote(newVote)
          print("newVote : \(newVote.title)")
        }
      }
      .sheet(isPresented: $showingEditorEdit) {
        // 기존의 뷰모델을 줘야함
        VoteEditorView(viewModel: VoteEditorViewModel(vote: voteForEdit)) { updateVote in
          //          if let vote = newVote{
          //            viewModel.addVote(vote)
          //          }
          
          viewModel.addVote(updateVote)
        }
      }
    }
  }
}

#Preview {
  VoteListView()
}
