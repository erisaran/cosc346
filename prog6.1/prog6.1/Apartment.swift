//
//  Apartment.swift
//  prog6.1
//
//  Created by Benjaman Dutton on 8/24/16.
//  Copyright © 2016 Benjaman Dutton. All rights reserved.
//

import Foundation

class Apartment : CustomStringConvertible {
    
    let number : Int
    weak var tenant: Person?
    
    var description: String {
        return("Apartment \(number)")
    }
    
    init(number: Int) {
        self.number = number
        print("\(self) is being initialised")
    }
    
    deinit {
        print("\(self) is being deinitialised")
    }
}