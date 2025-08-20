//
//  ContentView.swift
//  Practice01
//
//  Created by Admin on 8/18/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            VStack {
                HStack{
                    Image("zam")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(20)
                    Spacer()
                    VStack(alignment: .leading){
                        Text("아빠 저를 속이신 거예요?")
                            .font(.title).lineLimit(1).truncationMode(.tail)
                        Spacer().frame(height: 8)
                        Text("문좀 열어주세요")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }.padding().background(Color.green.opacity(0.3).cornerRadius(20))
                    
                }.padding().background(Color.yellow.opacity(0.3)).cornerRadius(20)
            }
            
            Spacer()
            Text("메시지 내보내기")
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(16)
        }.padding()
        
        
    }
}

#Preview {
    ContentView()
}
