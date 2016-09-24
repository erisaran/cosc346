//
//  main.swift
//  prog6.1
//
//  Created by Benjaman Dutton on 8/24/16.
//  Copyright © 2016 Benjaman Dutton. All rights reserved.
//

import Foundation

repeat {
    var number73 = Apartment(number: 73)
    var john = Person(name: "John Smith")
    
    john.apartment = number73
    number73.tenant = john
} while(false)