////
//  VoteViewModel.swift
//  MVVMStudy
//
//  Created by choosla on 8/29/25.
//

import Foundation

class VoteViewModel: ObservableObject {
  @Published var vote: Vote
  
  init(vote: Vote){
    self.vote = vote
  }
  
  func voteForOption(_ option: String){
    if let count = vote.options[option]{
      vote.options[option]! += 1
    }
  }
}
