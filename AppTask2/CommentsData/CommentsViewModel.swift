//
//  CommentsViewModel.swift
//  AppTask2
//
//  Created by Ashu on 31/03/23.
//

import Foundation
class CommentsViewModel{
    var commentsData = [Comments]()
    func photosData(completion: @escaping (Bool,Error?) -> ()){
        APIHandler.opertationWithRequest(withApi: .Comments){(result: Result<[Comments], Error>) in
            switch result{
                case .success(let object):
                self.commentsData = object
                completion(true, nil)
                
            case .failure(let error):
                Utility.printToConsole(message: error)
                completion(false, error)
            }
        }
    }
}
