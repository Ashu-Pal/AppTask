//
//  CommentsOnPostsViewModel.swift
//  AppTask2
//
//  Created by Ashu on 01/04/23.
//

import Foundation
class CommentsOnPostsViewModel{
    var commentsOnPostsData = [Comments]()
    var id: Int = 0
    func getCommentsOnPosts(completion: @escaping (Bool,Error?) -> ()){
        APIHandler.opertationWithRequest(withApi: .CommentsOnPosts(id: id)){(result: Result<[Comments], Error>) in
            switch result{
                case .success(let object):
                self.commentsOnPostsData = object
                completion(true, nil)
                
            case .failure(let error):
                Utility.printToConsole(message: error)
                completion(false, error)
            }
        }
    }
}
