//
//  ContentView.swift
//  MVVMStudy
//
//  Created by choosla on 8/29/25.
//

import SwiftUI
import SwiftData

struct VoteListView: View {
  @Environment(\.modelContext) private var context
  //  @Query private var votes: [Vote] // 자동 fetch
  
  @StateObject private var viewModel = VoteListViewModel()
  @State private var showingEditorCreate = false
  @State private var voteForEdit: Vote?
  var body: some View {
    NavigationStack{
      List{
        ForEach(viewModel.votes){ vote in
          NavigationLink(destination: VoteView(vote: vote)) {
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
        }
        .onDelete { IndexSet in
          viewModel.deleteVote(vote: viewModel.votes[IndexSet.first!])
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
          viewModel.addVote(newVote)
        }
      }
      .sheet(item: $voteForEdit) { item in
        // 기존의 뷰모델을 줘야함
        VoteEditorView(viewModel: VoteEditorViewModel(vote: item)) { updateVote in
          viewModel.updateVote(updateVote)
        }
      }
      .onAppear{
        // MVVM 패턴의 시작
        // 화면에 필요한 데이터의 관리 주체를 따로 분리
        viewModel.setContext(context)
      }
    }
  }
}

#Preview {
  VoteListView()
}
