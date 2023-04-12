//
//  PostModel.swift
//  AppTask2
//
//  Created by Ashu on 27/03/23.
//

import Foundation
struct Posts: Codable{
    var  id: Int
    var userId: Int
    var title: String
    var body: String
    
    enum Codingkeys: String, CodingKey{
        case userId = "userId"
        case id = "id"
        case title = "title"
        case body = "body"
    }
    
}
