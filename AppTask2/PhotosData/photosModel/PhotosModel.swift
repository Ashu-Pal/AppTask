//
//  PhotosViewModel.swift
//  AppTask2
//
//  Created by Ashu on 30/03/23.
//

import Foundation
struct Photos: Codable{
    var albumId: Int
    var id: Int
    var title: String
    var url: String?
    var thumbnailUrl: String
    
    enum codingkeys: String, CodingKey{
        case albumId = "albumId"
        case id = "id"
        case title = "tilte"
        case url = "url"
        case thumbnailUrl = "thumbnailUrl"
    }
    
}
