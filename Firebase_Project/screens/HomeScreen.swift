//
//  HomeScreen.swift
//  Firebase_Project
//
//  Created by Ziloliddin Kamolov on 03/02/23.
//

import SwiftUI

struct HomeScreen: View {
    
    @EnvironmentObject var session: SessionStore
    @State var text = "Welcome"
     
    
    func doSignOut() {
        if SessionStore().signOut() {
            session.listen()
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if let email = session.session?.email {
                    Text("Welcome " + email)
                }
            }
            .navigationBarItems(trailing:
                                    HStack {
                Button(action: {
                    
                }, label: {
                    Image(systemName: "plus")
                })
                Button(action: {
                    doSignOut()
                }, label: {
                    Image(systemName: "figure.run")
                })
            } )
            .navigationBarTitle("Posts", displayMode: .inline)
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
