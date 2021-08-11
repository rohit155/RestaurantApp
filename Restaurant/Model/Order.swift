//
//  Order.swift
//  Restaurant
//
//  Created by Rohit Jangid on 08/03/21.
//

import Foundation

struct Order: Codable {
    var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
