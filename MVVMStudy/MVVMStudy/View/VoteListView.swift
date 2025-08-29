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
            }){
              Image(systemName: "pencil")
            }
          }
        }
        .onDelete { IndexSet in
          viewModel.deleteVote(id: viewModel.votes[IndexSet.first!].id)
        }
      }
      .navigationTitle("투표 목록")
      .toolbar{
        
        Button(action : {
          
          showingEditorCreate = true
          //            viewModel.addVote(Vote(id: UUID(), title: "새로운 투표", options: ["항목1"]))
        }){
          Image(systemName: "plus")
        }
        EditButton()
      }
      
      
      .sheet(isPresented: $showingEditorCreate) {
        VoteEditorView(viewModel: VoteEditorViewModel()) { newVote in
          //          if let vote = newVote{
          //            viewModel.addVote(vote)
          //          }
          print("VoteListView에 해당 Voteㅈ")
          viewModel.addVote(newVote)
        }
      }
      .sheet(item: $voteForEdit) { item in
        // 기존의 뷰모델을 줘야함
        VoteEditorView(viewModel: VoteEditorViewModel(vote: item)) { updateVote in
          //          if let vote = newVote{
          //            viewModel.addVote(vote)
          //          }
          
          viewModel.updateVote(updateVote)
        }
      }
    }
  }
}

#Preview {
  VoteListView()
}
