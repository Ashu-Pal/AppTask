//
//  PhotosViewModel.swift
//  AppTask2
//
//  Created by Ashu on 30/03/23.
//

import Foundation
class PhotosViewModel{
    var photosData = [Photos]()
    func photosData(completion: @escaping (Bool,Error?) -> ()){
        APIHandler.opertationWithRequest(withApi: .Photos){(result: Result<[Photos], Error>) in
            switch result{
                case .success(let object):
                self.photosData = object
                completion(true, nil)
                
            case .failure(let error):
                Utility.printToConsole(message: error)
                completion(false, error)
            }
        }
    }
}
