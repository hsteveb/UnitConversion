//
//  Length.swift
//  UnitConversion
//
//  Created by Hector Barrios on 7/25/20.
//  Copyright © 2020 Hector Barrios. All rights reserved.
//

import Foundation

class Length: Unit {
    
    private enum LengthUnit: String, CaseIterable {
        case meter
        case kilometers
        case feet
        case yards
        case miles
    }
    
    func convert(_ value: Double, _ firstValueUnit: String, _ secondValueUnit: String) -> Double {
        guard let firstUnit = LengthUnit(rawValue: firstValueUnit),
            let secondUnit = LengthUnit(rawValue: secondValueUnit) else { return 0.0 }
        
        return 0.0
    }
    
    func string() -> String {
        return "Length"
    }
    
    func getArray() -> [String] {
        LengthUnit.allCases.compactMap { length in
            length.rawValue.capitalized
        }
    }
}
