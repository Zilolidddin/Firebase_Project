//
//  User.swift
//  Firebase_Project
//
//  Created by Ziloliddin Kamolov on 14/02/23.
//

import Foundation

struct User {
    var uid: String?
    var email: String?
    var displayName: String?

    init(uid: String, displayName: String?, email: String?) {
        self.uid = uid
        self.email = email
        self.displayName = displayName
    }
    
}
