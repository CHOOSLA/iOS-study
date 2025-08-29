//
//  VoteViewModel.swift
//  MVVMStudy2
//
//  Created by choosla on 8/29/25.
//

import Foundation

class VoteViewModel: ObservableObject {
  @Published var vote = Vote(title: "ViewModel 원래 텍스트")
}
