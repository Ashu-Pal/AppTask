//
//  PostViewModel+ID.swift
//  AppTask2
//
//  Created by Ashu on 29/03/23.
//

import Foundation
class PostIDViewModel{
    var postsData = [Posts]()
    var ID = ""
    func getpostsID(completion: @escaping (Bool,Error?) -> ()){
        APIHandler.opertationWithRequest(withApi: .UserPosts(id: ID)){(result: Result<[Posts], Error>) in
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
