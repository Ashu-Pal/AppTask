//
//  PostViewModel.swift
//  AppTask2
//
//  Created by Ashu on 27/03/23.
//

import Foundation
class PostViewModel{
    var postsData = [Posts]()
    
    func getposts(completion: @escaping (Bool,Error?) -> ()){
        APIHandler.opertationWithRequest(withApi: .Posts){(result: Result<[Posts], Error>) in
            switch result{
                case .success(let object):
                self.postsData = object
                completion(true, nil)
                
            case .failure(let error):
                Utility.printToConsole(message: error)
                completion(false, error)
            }
        }
    }
    
    
}
