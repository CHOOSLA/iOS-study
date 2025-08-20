//
//  ContentView.swift
//  2Image
//
//  Created by Admin on 8/18/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // 시스템 이미지 사용
            Image(systemName: "globe") // SF Symbol 이름, 글자크기
                .imageScale(.large) // 스몰, 미디움(기본), 라지
                .foregroundStyle(.orange)
            
            Image(systemName: "globe")
                .font(.system(size: 32))
                .foregroundStyle(.yellow)
            
            Image("jam") // Assets.xcassets 안의 이름
                .resizable() // 이렇게 해야만 크기 조절이 가능
                .scaledToFit() // 비율 유지하며 프레임 안에 "맞춤"
                .frame(width: 200, height: 200)
                .background(Color.gray)
            
            Image("jam")
                .resizable() // 이렇게 해야만 크기 조절 가능
                .scaledToFill() // 비율 유지하며 프레임 안에 "맞춤"
                .frame(width: 200, height: 100)
                .background(Color.gray)
                .clipped() // 프레임 밖으로 나가는 부분 자르기
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
