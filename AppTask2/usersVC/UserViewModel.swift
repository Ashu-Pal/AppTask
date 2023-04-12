//
//  UserViewModel.swift
//  AppTask2
//
//  Created by Ashu on 28/03/23.
//

import Foundation
class UserViewModel{
    var UsersData = [Users]()
    
    func getUsers(completion: @escaping (Bool,Error?) -> ()){
        APIHandler.opertationWithRequest(withApi: .Users){(result: Result<[Users], Error>) in
            switch result{
            case .success(let object):
                self.UsersData = object
                completion(true, nil)
                
            case .failure(let error):
                Utility.printToConsole(message: error)
                completion(false, error)
            }
        }
    }
}
