//
//  AlbumModel.swift
//  AppTask2
//
//  Created by Ashu on 29/03/23.
//

import Foundation

struct Albums: Codable{
    var userId: Int
    var id: Int
    var title: String
    
    enum codikeys: String, CodingKey{
        case userId = "userId"
        case id = "id"
        case title = "title"
    }
}

