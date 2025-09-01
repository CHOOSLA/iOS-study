//
//  AuthView.swift
//  Clazzi
//
//  Created by choosla on 8/27/25.
//

import SwiftUI
import SwiftData
import FirebaseAuth

struct AuthView: View {
  @Binding var currentUser : FirebaseAuth.User?
  
  @State private var email: String = ""
  @State private var password: String = ""
  @State private var isPrivacyAgreed: Bool = false
  @State private var isLogin: Bool = false // 처음에 회원가입 폼
  @State private var isPasswordSecured = true

  
  var body: some View {
    NavigationStack {
      VStack {
        Form {
          TextField("이메일", text: $email)
            .keyboardType(.emailAddress)
            .autocapitalization(.none) // 자동 대문자 방지
            .textInputAutocapitalization(.never) // 자동 대문자 방지: iOS 15 이상
            .disableAutocorrection(true) // 자동 수정 방지
            .padding()
            .background(
              RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1)
            )
            .padding(.bottom, 6)
          ZStack {
            if isPasswordSecured {
              SecureField("비밀번호", text: $password)
                .autocapitalization(.none) // 자동 대문자 방지
                .textInputAutocapitalization(.never) // 자동 대문자 방지: iOS 15 이상
                .disableAutocorrection(true) // 자동 수정 방지
                .padding()
                .background(
                  RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
                )
            } else {
              TextField("비밀번호", text: $password)
                .autocapitalization(.none) // 자동 대문자 방지
                .textInputAutocapitalization(.never) // 자동 대문자 방지: iOS 15 이상
                .disableAutocorrection(true) // 자동 수정 방지
                .padding()
                .background(
                  RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
                )
            }
            HStack {
              Spacer()
              Button(action: {
                isPasswordSecured.toggle()
              }) {
                Image(systemName: isPasswordSecured ? "eye.slash" : "eye")
                  .foregroundStyle(.black)
                  .padding(.trailing)
              }
            }
            
          }
          
        }
        .formStyle(.columns)
        .padding(.bottom)
        
        if !isLogin {
          Button(action: {
            isPrivacyAgreed.toggle()
          }) {
            HStack {
              Image(systemName: isPrivacyAgreed ? "checkmark.square.fill" : "square")
                .foregroundColor(isPrivacyAgreed ? .blue : .gray)
                .font(.title2)
              NavigationLink(destination: PrivacyView()) {
                Text("개인정보")
                  .underline()
                  .font(.body)
                  .foregroundStyle(.black)
              }
              Text("동의")
                .font(.body)
                .foregroundStyle(.black)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom)
          }
        }
        
        
        Button(action: {
          Task{
            await preformAuth()
          }
        }) {
          Text(isLogin ? "로그인" : "가입하기")
            .frame(maxWidth: .infinity)
            .padding()
            .background(!email.isEmpty && !password.isEmpty && (isPrivacyAgreed || isLogin) ?Color.blue : Color.gray)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .padding(.bottom)
        .disabled(email.isEmpty || password.isEmpty || !(isPrivacyAgreed || isLogin))
        
        Button(isLogin ? "회원가입 화면으로" : "로그인 화면으로") {
          isLogin.toggle()
        }
      }
      .navigationTitle(Text(isLogin ? "로그인" : "회원가입"))
      .padding()
      .toolbar {
        ToolbarItem(placement:
            .navigationBarTrailing) {
              NavigationLink(destination:
                              UserListView()) {
                Image(systemName: "person")
              }
            }
      }
    }
  }
  
  // Firebase Auth 로그인/회원가입 함수
  private func preformAuth() async {
    do{
      if isLogin { // 로그인 일 때
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        currentUser = result.user
        print("Firebase 로그인 성공")
      } else {
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        currentUser = result.user
        print("Firebase 회원가입 성공")
      }
    } catch {
      print("Firebase Auth 오류 : \(error.localizedDescription)")
    }
  }
}

