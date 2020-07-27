//
//  Temperature.swift
//  UnitConversion
//
//  Created by Hector Barrios on 7/25/20.
//  Copyright © 2020 Hector Barrios. All rights reserved.
//

import Foundation

class Temperature: Unit {
    
    private var conversion1 = 1.0
    private var conversion2 = 273.15
    private var conversion3 = 5.0/9.0
    private var conversion4 = 32.0
    private var conversion5 = 459.67
    
    private enum TemperatureUnit: String, CaseIterable {
        case celcius
        case fahrenheit
        case kelvin
    }
    
    func convert(_ value: Double, _ firstValueUnit: String, _ secondValueUnit: String) -> Double {
        guard let firstUnit = TemperatureUnit(rawValue: firstValueUnit),
            let secondUnit = TemperatureUnit(rawValue: secondValueUnit) else { return 0.0 }
        
        if firstUnit == secondUnit {
            return value * conversion1
        }
        
        switch(firstUnit) {
        case .celcius:
            switch(secondUnit) {
            case .fahrenheit:
                return value * (1 / conversion3) + 32.0
            default:
                return value + conversion2
            }
        case .fahrenheit:
            switch(secondUnit) {
            case .celcius:
                return (value - conversion4)  * conversion3
            default:
                return (value + conversion5) * conversion3
            }
        default:
            switch(secondUnit) {
            case .celcius:
                return value - conversion2
            default:
                return value / conversion3 - conversion5
            }
        }
    }
    
    func string() -> String {
        return "Temperature"
    }
    
    func getArray() -> [String] {
        return TemperatureUnit.allCases.compactMap { temp in
            temp.rawValue
        }
    }
}
