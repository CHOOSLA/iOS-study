//
//  ContentView.swift
//  Demo
//
//  Created by choosla on 2025/08/27.
//

import SwiftUI

// 제목/부제목을 내비게이션 중앙에 표시하는 간단한 뷰를 정의한다.
struct ToolbarTitleText: View {
  let title: String              // 메인 타이틀 텍스트를 받는다.
  let subtitle: String?          // 선택적 서브타이틀을 받는다.
  
  var body: some View {
    VStack(spacing: 0) {
      // 메인 타이틀을 한 줄로 표시한다.
      Text(title)
        .font(.headline)
        .lineLimit(1)
        .truncationMode(.tail)
        .minimumScaleFactor(0.85)
      
      // 서브타이틀이 있으면 작게 함께 표시한다.
      if let subtitle, !subtitle.isEmpty {
        Text(subtitle)
          .font(.caption)
          .foregroundStyle(.secondary)
          .lineLimit(1)
          .truncationMode(.tail)
          .minimumScaleFactor(0.85)
          .padding(.top, 1)
      }
    }
    // 타이틀 영역 폭을 과도하게 차지하지 않도록 제한한다.
    .frame(maxWidth: 220)
    // 접근성에서 헤더로 읽히도록 지정한다.
    .accessibilityElement(children: .combine)
    .accessibilityAddTraits(.isHeader)
  }
}

struct ContentView: View {
  @State private var useLogo = true     // 로고(커스텀 뷰) 타이틀 사용 여부를 제어한다.
  @State private var largeMode = false  // large/inline 모드 전환을 제어한다.
  
  var body: some View {
    NavigationStack {
      List {
        // 데모를 위한 토글 UI를 제공한다.
        Toggle("로고 타이틀 사용", isOn: $useLogo)
        Toggle("Large 모드", isOn: $largeMode)
        
        Section("미리보기") {
          VStack(alignment: .leading, spacing: 8) {
            Text("타이틀 전환, 말줄임, 접근성 동작을 확인한다.")
            Text("스크롤/뒤로가기 제스처에서도 자연스럽게 동작한다.")
              .font(.caption)
              .foregroundStyle(.secondary)
          }
          .padding(.vertical, 8)
        }
      }
      // 시스템 컨텍스트(백 버튼 레이블, VoiceOver 등)를 위해 실제 navigationTitle도 설정한다.
      .navigationTitle(useLogo ? "FlipFlick" : "영화 포스터 월드컵")
      .navigationBarTitleDisplayMode(largeMode ? .large : .inline)
      
      // 커스텀 타이틀은 툴바 principal 위치에 배치한다.
      .toolbar {
        ToolbarItem(placement: .principal) {
          // === 여기서 분기만 둔다(복잡한 제네릭 체인을 피한다). ===
          if useLogo {
            // 로고 이미지 예시: 에셋 카탈로그의 "logo" 사용을 가정한다.
            Image("logo")
              .resizable()                // 크기 조절 가능하게 한다.
              .scaledToFit()              // 비율 유지하며 맞춘다.
              .frame(height: largeMode ? 28 : 24) // 모드에 따라 높이를 조정한다.
              .accessibilityLabel("FlipFlick")    // 보조기능용 레이블을 제공한다.
              .accessibilityAddTraits(.isHeader)  // 헤더로 인식되게 한다.
          } else {
            // 텍스트(+서브타이틀) 타이틀을 표시한다.
            ToolbarTitleText(
              title: "영화 포스터 월드컵",
              subtitle: "Round of 16"
            )
          }
        }
      }
      // 스크롤 시 바 배경이 사라지지 않게 고정한다(필요 시).
      .toolbarBackground(.visible, for: .navigationBar)
      .toolbarBackground(.bar, for: .navigationBar)
    }
  }
}

#Preview {
  ContentView()
}
