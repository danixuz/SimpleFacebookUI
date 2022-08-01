//
//  Story.swift
//  SimpleFacebookUI
//
//  Created by Daniel Spalek on 31/07/2022.
//

import Foundation

struct Story: Identifiable{
    let id: String = UUID().uuidString
    var user: User
    var picture: String = "story1"
}


var sampleStories: [Story] = [
    Story(user: sampleUsers[0], picture: "story1"),
    Story(user: sampleUsers[3], picture: "story4"),
    Story(user: sampleUsers[2], picture: "story3"),
    Story(user: sampleUsers[1], picture: "story2")
    
]
