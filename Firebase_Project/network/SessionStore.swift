//
//  SessionStore.swift
//  Firebase_Project
//
//  Created by Ziloliddin Kamolov on 14/02/23.
//

import Foundation
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
                self.session = User(uid: user.uid, displayName: user.displayName, email: user.email)
            } else {
                self.session = nil
            }
        }
    }
    
    // additional methods (sign up, sign in) will go here
    
    func signUp(withEmail email: String, password: String, completion: @escaping(AuthDataResult?, Error?) -> Void) {    Auth.auth().signIn(withEmail: email, password: password, completion: completion)   }
    
    func signIn(withEmail email: String, password: String, completion: @escaping(AuthDataResult?, Error?) -> Void) {    Auth.auth().signIn(withEmail: email, password: password, completion: completion)   }
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
