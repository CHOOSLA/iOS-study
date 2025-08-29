//
//  VoteListViewModel.swift
//  MVVMStudy
//
//  Created by choosla on 8/29/25.
//

import Foundation
import SwiftUICore

class VoteListViewModel: ObservableObject{
  @Published var votes:[Vote] = []
  
  func getVotes() -> [Vote]{
    return votes
  }
  
  func addVote(_ vote: Vote){
    votes.append(vote)
  }
  
  func deleteVote(id: UUID){
    votes.removeAll { $0.id == id }
  }
  
  func updateVote(_ vote: Vote){
    if let index = votes.firstIndex(where : { $0.id == vote.id}){
      votes[index] = vote
    }
  }
}
