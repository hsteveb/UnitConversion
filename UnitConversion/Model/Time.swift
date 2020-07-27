//
//  Time.swift
//  UnitConversion
//
//  Created by Hector Barrios on 7/24/20.
//  Copyright © 2020 Hector Barrios. All rights reserved.
//

import Foundation

class Time: Unit {
    
    private let conversion1 = 1.0
    private let conversion2 = 60.0
    private let conversion3 = pow(60.0, 2.0)
    private let hoursToDays = 24.0
    
    private enum TimeUnit: String, CaseIterable {
        case second
        case minute
        case hour
        case day
    }
    
    func convert(_ value: Double, _ firstValueUnit: String, _ secondValueUnit: String) -> Double {
        
        guard let firstValue = TimeUnit(rawValue: firstValueUnit),
            let secondValue = TimeUnit(rawValue: secondValueUnit) else { return 0.0 }
        
        if(firstValue == secondValue) {
            return value * conversion1
        }
        
        switch(firstValue) {
        
        case .second:
            switch(secondValue) {
            case .minute:
                return value / conversion2
            case .hour:
                return value / conversion3
            default:
                return value / (conversion3 * hoursToDays)
            }
            
        case .minute:
            switch secondValue {
            case .second:
                return  value * conversion2
            case .hour:
                return value / conversion2
            default:
                return value / (conversion2 * hoursToDays)
                
            }
            
        case .hour:
            switch secondValue {
            case .second:
                return value * conversion3
            case .minute:
                return value * conversion2
            default:
                return value / hoursToDays
            }
            
        default:
            switch secondValue {
            case .second:
                return conversion3 * hoursToDays
            case .minute:
                return conversion2 * hoursToDays
            default:
                return hoursToDays
            }
        }
    
    }
    
    func string() -> String {
        return "Time"
    }
    
    func getArray() -> [String] {
        return TimeUnit.allCases.compactMap { time in
            time.rawValue
        }
    }
    
}
