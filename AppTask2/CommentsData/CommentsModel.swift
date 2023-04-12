//
//  CommentsModel.swift
//  AppTask2
//
//  Created by Ashu on 31/03/23.
//

import Foundation
struct Comments: Codable{
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
    
    enum codingkeys: String, CodingKey{
        case postId = "postId"
        case id = "id"
        case name = "name"
        case email = "email"
        case body = "body"
    }
}
