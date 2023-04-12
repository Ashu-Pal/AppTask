//
//  UsersModel.swift
//  AppTask2
//
//  Created by Ashu on 28/03/23.
//

import Foundation
struct Users: Codable{
    var id: Int?
    var name: String?
    var username: String?
    var email: String?
    var address: Address
    var phone: String?
    var website: String?
    var company: companyAddress
    
    enum Codingkeys: String, CodingKey{
        case id = "id"
        case name = "name"
        case username = "username"
        case email = "email"
        case address = "address"
        case phone = "phone"
        case website = "website"
        case company = "company"
    }
}

// MARK: - for geolocation structure
struct geolocation: Codable{
    var lat: String?
    var lng: String?
    
    enum Codingkeys: String,CodingKey{
        case lat = "lat"
        case lng = "lng"
    }
}

// MARK: - for address structure
struct Address: Codable{
    var street: String
    var suite: String
    var city: String
    var zipcode: String
    var geo: geolocation
    
    enum codingkeys: String,CodingKey{
        case street = "street"
        case suite = "suite"
        case city = "city"
        case zipcode = "zipcode"
        case geo = "geo"
    }
}
// MARK: - company address
struct companyAddress: Codable{
    var name: String?
    var catchPhrase: String?
    var bs: String?
    
    enum codingkeys: String,CodingKey{
        case name = "name"
        case catchPhrase = "catchPhrase"
        case bs = "bs"
    }
}
