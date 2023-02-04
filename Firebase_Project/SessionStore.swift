//
//  SessionStore.swift
//  Firebase_Project
//
//  Created by Ziloliddin Kamolov on 03/02/23.
//

import Foundation
import Combine
import Firebase

class SessionStore: ObservableObject {
    
    var didChange = PassthroughSubject<SessionStore, Never>()
    @Published var session: User? { didSet { self.didChange.send(self) }}
    var handle: AuthStateDidChangeListenerHandle?
    
    func listen () {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                print("Got user: \(user)")
                // some changes by macbook
                self.session = User(uid: user.uid, email: user.email, displayName: user.displayName)
            } else {
                self.session = nil
            }
        }
    }
    
    
    func signUp(email: String, password: String, handler: @escaping (AuthDataResult?, Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
    }
    
    func signIn(email: String, password: String, handler: @escaping (AuthDataResult?, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }
    
    func signOut () -> Bool {
        do {
            try Auth.auth().signOut()
            self.session = nil
            return true
        } catch {
            return false
        }
    }
}

