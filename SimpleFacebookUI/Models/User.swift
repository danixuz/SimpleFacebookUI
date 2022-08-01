//
//  User.swift
//  SimpleFacebookUI
//
//  Created by Daniel Spalek on 31/07/2022.
//

import Foundation

struct User: Identifiable {
    let id = UUID().uuidString
    var firstName: String
    var lastName: String
    var fullName: String {
        return ("\(firstName) \(lastName)")
    }
    var picture: String = "defaultUserPicture"
    
}




let sampleUsers: [User] = [
    User(firstName: "Mark", lastName: "Zuck", picture: "markzuck"),
    User(firstName: "Steve", lastName: "Jobs", picture: "stevejobs"),
    User(firstName: "Giancarlo", lastName: "Esposito", picture: "giancarlo"),
    User(firstName: "Lebron", lastName: "James", picture: "lebronjames")
]
