//
//  Person.swift
//  prog6.1
//
//  Created by Benjaman Dutton on 8/24/16.
//  Copyright © 2016 Benjaman Dutton. All rights reserved.
//

import Foundation

class Person : CustomStringConvertible {
    
    let name: String
    
    var apartment: Apartment?
    
    var description: String {
        return("Person \(name)")
    }
    
    init(name: String) {
        self.name = name
        print("\(self) is being initialised")
    }
    
    deinit {
        print("\(self) is being deinitialised")
    }
}