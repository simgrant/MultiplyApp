//
//  Question.swift
//  MultiplyApp
//
//  Created by Simone  on 1/8/25.
//

import Foundation

struct Question {
    let multiplicand: Int
    let multiplier: Int
    
    var product: Int {
        return multiplicand * multiplier
    }
    
    init(multiplicand: Int, multiplier: Int) {
        self.multiplicand = multiplicand
        self.multiplier = multiplier
    }
}
