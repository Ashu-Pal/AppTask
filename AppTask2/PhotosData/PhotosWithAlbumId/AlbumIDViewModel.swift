//
//  PhotosWithAlbumID.swift
//  AppTask2
//
//  Created by Ashu on 30/03/23.
//

import Foundation
class AlbumIDViewModel {
    var photosIdData = [Photos]()
    var ID = ""
    func getAlbumID(completion: @escaping (Bool,Error?) -> ()){
        APIHandler.opertationWithRequest(withApi: .AlbumID(id: ID)){(result: Result<[Photos], Error>) in
            switch result{
            case .success(let object):
                self.photosIdData = object
                completion(true, nil)
                
            case .failure(let error):
                Utility.printToConsole(message: error)
                completion(false, error)
            }
        }
    }
}
