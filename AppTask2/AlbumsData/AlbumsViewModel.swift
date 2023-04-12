//
//  AlbumsViewModel.swift
//  AppTask2
//
//  Created by Ashu on 29/03/23.
//

import Foundation
class AlbumsViewModel{
    var albumData = [Albums]()
    
    func getAlbumsData(completion: @escaping (Bool,Error?) -> ()){
        APIHandler.opertationWithRequest(withApi: .Albums){(result: Result<[Albums], Error>) in
            switch result{
            case .success(let object):
                self.albumData = object
                completion(true, nil)
                
            case .failure(let error):
                Utility.printToConsole(message: error)
                completion(false, error)
            }
        }
    }
}
