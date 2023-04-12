//
//  UsersAlbumViewModel.swift
//  AppTask2
//
//  Created by Ashu on 31/03/23.
//

import Foundation
class UsersAlbumViewModel{
    var usersalbumData = [Albums]()
    var ID = 0
    func getUsersAlbumsData(completion: @escaping (Bool,Error?) -> ()){
        APIHandler.opertationWithRequest(withApi: .UsersAlbums(id: ID)){(result: Result<[Albums], Error>) in
            switch result{
            case .success(let object):
                self.usersalbumData = object
                completion(true, nil)
                
            case .failure(let error):
                Utility.printToConsole(message: error)
                completion(false, error)
            }
        }
    }
}
