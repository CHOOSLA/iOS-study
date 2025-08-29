//
//  VoteListViewModel.swift
//  MVVMStudy
//
//  Created by choosla on 8/29/25.
//

import Foundation
import SwiftUICore
import SwiftUI
import SwiftData

class VoteListViewModel: ObservableObject{
  @Published var votes:[Vote] = []
  
  private var context: ModelContext?
  
  func getVotes() -> [Vote]{
    return votes
  }
  
  func setContext(_ context: ModelContext){
    self.context = context
    fetchVotes()
  }
  
  func fetchVotes(){
    guard let context else { return }
    let desciptor = FetchDescriptor<Vote>()
    if let results = try? context.fetch(desciptor){
      self.votes = results
    }
  }
  
  func addVote(_ vote: Vote){
    guard let context else {return}
    context.insert(vote)
    try? context.save()
    fetchVotes()
  }
  
  func deleteVote(vote: Vote){
    guard let context else {return}
    context.delete(vote)
    try? context.save()
    fetchVotes()
  }
  
  func updateVote(_ vote: Vote){
    guard let context else { return }
    // vote는 이미 SwiftData에서 관리 중인 객체라 속성이 변경되어 있다면 그대로 저장하면됨
    // 굳이 vote를 받아오는 이유는 나중에 파이어베이스, restAPI 대응하기 위해
    try? context.save()
    fetchVotes()
  }
}
