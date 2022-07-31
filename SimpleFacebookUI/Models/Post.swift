//
//  Post.swift
//  SimpleFacebookUI
//
//  Created by Daniel Spalek on 31/07/2022.
//

import Foundation

struct Post: Identifiable{
    let id: String = UUID().uuidString
    var user: User
    var text: String = "Hello, this is my first post here on Facebook."
    var timeAgo: String = "1 min"
    var commentCount: Int = 1250
    var shareCount: Int = 2500
}

var samplePosts: [Post] = [
    Post(user: sampleUsers[0]),
    Post(user: sampleUsers[1], text: "I just signed up to Facebook, how is everybody?", timeAgo: "12 min", commentCount: 1100, shareCount: 357)
]
