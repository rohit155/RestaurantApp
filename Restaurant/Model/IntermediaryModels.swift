//
//  IntermediaryModels.swift
//  Restaurant
//
//  Created by Rohit Jangid on 08/03/21.
//

import Foundation

struct Categories: Codable {
    let categories: [String]
}

struct PreparationTime: Codable {
    let prepTime: Int
    
    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
    }
}
