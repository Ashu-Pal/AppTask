//
//  ToDosModel.swift
//  AppTask2
//
//  Created by Ashu on 30/03/23.
//

import Foundation
struct ToDos: Codable{
    var userId: Int
    var id: Int
    var title: String
    var completed: Bool
    
    enum Codingkeys: String, CodingKey{
        case userId = "userId"
        case id = "id"
        case title = "title"
        case completed = "completed"
    }
}
