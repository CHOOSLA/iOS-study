//
//  ContentView.swift
//  3Spacing&Padding
//
//  Created by Admin on 8/18/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //        ScrollView { // 스크롤뷰로 가운데 정렬을 없애버림
        VStack(alignment : .leading){
            Spacer()
            Text("텍스트입니다")
            
            Spacer()
            HStack{
                Text("왼쪽")
                Spacer().frame(width: 50)
                Text("오른쪽")
                Spacer()
                Text("오른쪽2")
            }
            .padding()
            .background(.yellow)
            
            Spacer()
            
            // 패딩 스터디
            HStack{
                Text("안녕하세요")
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                    .background(.blue)
            }
            
            Spacer()
        }
        //        }
    }
}

#Preview {
    ContentView()
}
