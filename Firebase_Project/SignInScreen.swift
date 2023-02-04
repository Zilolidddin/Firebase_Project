//
//  SignInScreen.swift
//  Firebase_Project
//
//  Created by Ziloliddin Kamolov on 03/02/23.
//

import SwiftUI

struct SignInScreen: View {
    
    @EnvironmentObject var session: SessionStore
    @State var isLoading = false
    @State var email = "Anonymous@gmail.com"
    @State var password = "12345678"
      
    
    func doSignIn() {
        isLoading = true
        SessionStore().signIn(email: email, password: password, handler: {(ress, err) in
            isLoading = false
            if err != nil {
                print("Check email or password")
                return
            }
            session.listen()
            print("User signed in")
        })
    }
    
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Welcome back")
                    .font(Font.system(size: 30))
                TextField("Email", text: $email)
                    .frame(height: 45)
                    .padding(.leading, 10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                SecureField("Password", text: $password)
                    .frame(height: 45)
                    .padding(.leading, 10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                Button(action: {
                    doSignIn()
                }, label: {
                    Spacer()
                    Text("Sign In")
                        .foregroundColor(.white)
                    Spacer()
                })
                .frame(height: 45)
                .background(Color.blue)
                .cornerRadius(8)
                Spacer()
                VStack {
                    Spacer()
                    HStack {
                        Text("Don't have an account?")
                        NavigationLink(destination: SignUpScreen(), label: {
                            Text("Sign Up")
                        })
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 200)
            }
            .padding()
            if isLoading {
                ProgressView()
            }
        }
    }
}
struct SignInScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreen()
    }
}
