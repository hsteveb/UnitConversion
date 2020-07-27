//
//  Unit.swift
//  UnitConversion
//
//  Created by Hector Barrios on 7/24/20.
//  Copyright © 2020 Hector Barrios. All rights reserved.
//

import Foundation

protocol Unit {
    
    func string() -> String
    
    func convert(_ value: Double, _ firstValueUnit: String,_ secondValueUnit: String) -> Double
    
    func getArray() -> [String] 
}
