//
//  SignUpScreen.swift
//  Firebase_Project
//
//  Created by Ziloliddin Kamolov on 03/02/23.
//


import SwiftUI

struct SignUpScreen: View {
    
    @Environment(\.presentationMode) var presentation
    @State var isLoading = false
    @State var fullname = ""
    @State var email = ""
    @State var password = ""
    
    
    func doSignUp() {
        isLoading = true
        SessionStore().signIn(withEmail: email, password: password, completion: {(ress, err) in
            isLoading = false
            if err != nil {
                print("User not created")
                return
            }
            print("User created")
            self.presentation.wrappedValue.dismiss()
        })
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Spacer()
                Text("Create your account")
                    .font(Font.system(size: 30))
                TextField("Fullname", text: $fullname)
                    .frame(height: 45)
                    .padding(.leading, 10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
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
                    doSignUp()
                }, label: {
                    Spacer()
                    Text("Sign Up")
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
                        Text("Already have an account?")
                        Button(action: {
                            self.presentation.wrappedValue.dismiss()
                        }, label: {
                            Text("Sign In")
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
struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen()
    }
}
