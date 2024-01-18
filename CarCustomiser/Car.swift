//
//  Car.swift
//  CarCustomiser
//
//  Created by Tomas Lopez-Valcarcel on 18/01/2024.
//

import Foundation

struct Car {
    let make: String
    let model: String
    var topSpeed: Int
    var acceleration: Double
    var handling: Int
    
    func statsDisplay() -> String {
        return """
    Make: \(make)
    Model:\(model)
    Top Speed: \(topSpeed) mph
    Acceleration (0-60 in): \(acceleration)s
    Handling: \(handling)
"""
    }
}
