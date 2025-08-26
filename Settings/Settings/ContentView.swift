//
//  ContentView.swift
//  Settings
//
//  Created by choosla on 8/26/25.
//

import SwiftUI

struct ContentView: View {
  @State private var search:String = ""
    var body: some View {
      NavigationSplitView{
        NavigationStack {
          List{
            ProfileRow(title: "추창우")
            Section(){
              SettingRow(title: "비행기 모드")
              SettingRow(title: "Wi-Fi")
              SettingRow(title: "셀룰러")
            }
            
            Section("알림"){
              SettingRow(title: "알림")
              SettingRow(title: "사운드 및 햅틱")
            }
            
            Section("일반"){
              SettingRow(title: "일반")
              SettingRow(title: "손쉬운 사용")
              SettingRow(title: "개인정조 보호 및 보안")
            }
          }.navigationTitle(Text("설정"))
            .searchable(text: $search, prompt: "검색")
        }
      } detail: {
        Text("항목을 선택해주세요")
      }
      
    }
}

struct ProfileRow: View{
  var title: String
  
  var content: some View{
    Text(title)
  }
  
  var body: some View{
    
    NavigationLink(destination: Text(title)) {
      content
    }
    
  }
}

struct SettingRow: View{
  var title: String
  var hasNavigation: Bool = true
  
  var content: some View{
    Text(title)
  }
  
  var body: some View{
    if hasNavigation{
      NavigationLink(destination: Text("여긴 정보입니다")) {
        content
      }
    }else {
      Text("추창우")
    }
  }
}

#Preview {
    ContentView()
}
