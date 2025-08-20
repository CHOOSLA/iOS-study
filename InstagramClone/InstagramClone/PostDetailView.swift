//
//  PostDetailView.swift
//  InstagramClone
//
//  Created by choosla on 8/19/25.
//

import SwiftUI

import SwiftUI

struct PostDetailView: View {
    let post: Post
    
    var body: some View {
        VStack {
            Text(post.caption)
                .font(.body)
                .padding()
            Spacer()
        }
        .navigationTitle("Post Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
  let post = Post(userName : "_imDonglamalze", userImage: "developer",likeCount: 0,caption : "지금이제일행복해요",timeAgo: "12시간전")
  PostDetailView(post : post)
}
