//
//  ContentView.swift
//  InstagramClone
//
//  Created by choosla on 8/19/25.
//

import SwiftUI

struct Post : Identifiable {
  var id = UUID()
  var userName: String
  var userImage: String
  var likeCount: Int
  var caption: String
  var timeAgo : String
}

struct ContentView: View {
  
  var samplePosts = [
    Post(userName : "_imMonkiest", userImage: "monkey",likeCount: -999999,caption : "우가우가가우가가가",timeAgo: "1시간전"),
    Post(userName : "_imKookDae", userImage: "surfing",likeCount: -99,caption : "내눈을바라봐넌행복해지고",timeAgo: "3시간전"),
    Post(userName : "_imDonglamalze", userImage: "developer",likeCount: 999999,caption : "지금이제일행복해요",timeAgo: "12시간전"),
    
  ]
  
    var body: some View {
      NavigationStack{
        ScrollView {
          LazyVStack{
            ForEach(samplePosts){ post in
              NavigationLink(destination: PostDetailView(post: post)){
                FeedCardView(post: post)
              }.buttonStyle(.plain)
            }
          }.navigationTitle("Feed")
          .navigationBarTitleDisplayMode(.large)
        }
          .background(Color.gray.opacity(0.3))
      }
    }
}

struct FeedCardView : View {
  let post: Post
  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      HStack{
        Image(systemName: "person.crop.circle.fill")
          .font(.system(size: 30))
          .clipShape(Circle())
        Spacer().frame(maxWidth: 5)
        Text(post.userName)
          .font(.subheadline)
        Spacer()
        Image(systemName: "ellipsis")
      }.padding(.horizontal,10)
        .padding(.vertical,10)
      
      Image(post.userImage)
        .resizable()
        .frame(width : .infinity, height: 300)
        .scaledToFit()
        .clipped()
      
      Section{
        HStack{
          Image(systemName: "heart")
            .font(.system(size: 20))
          Image(systemName: "bubble.right")
            .font(.system(size: 20))
          Image(systemName: "paperplane")
            .font(.system(size: 20))
          Spacer()
          Image(systemName: "bookmark")
            .font(.system(size: 20))
        }.padding(10)
      }
      
      VStack(alignment: .leading, spacing: 5){
        Text("좋아요 \(post.likeCount)개")
        HStack {
          Text(post.userName).font(.body)
          Text(post.caption).font(.body)
        }
        .font(.caption)
        
        Text(post.timeAgo).foregroundStyle(.gray).font(.caption)
      }.padding()
      
      
    }.background()
    
    
  }
}

#Preview {
    ContentView()
}
