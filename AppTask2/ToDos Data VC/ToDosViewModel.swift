//
//  ToDosViewModel.swift
//  AppTask2
//
//  Created by Ashu on 30/03/23.
//

import Foundation
class ToDosViewModel{
    var toDosData = [ToDos]()
    
    func getToDos(completion: @escaping (Bool,Error?) -> ()){
        APIHandler.opertationWithRequest(withApi: .ToDos){(result: Result<[ToDos], Error>) in
            switch result{
            case .success(let object):
                self.toDosData = object
                completion(true, nil)
                
            case .failure(let error):
                Utility.printToConsole(message: error)
                completion(false, error)
            }
        }
    }
}
