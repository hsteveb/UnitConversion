//
//  ContentView.swift
//  UnitConversion
//
//  Created by Hector Barrios on 7/24/20.
//  Copyright © 2020 Hector Barrios. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var inputValue = ""
    
    
    @State var inputUnit = 0
    @State var inputMeasurement = 0
    
    @State var outputUnit = 0
    @State var outputMeasurement = 0
    
    let unit: [Unit] = [Time(), Temperature(), Length()]
    
    var result: Double {
        let value = Double(inputValue) ?? 0
        
        return unit[inputUnit].convert(value, unit[inputUnit].getArray()[inputMeasurement], unit[outputUnit].getArray()[outputMeasurement])
    }
    
    var body: some View {
        
        
        NavigationView{
            Form {
                
                Section(header: Text("Input")) {
                    Picker("Unit", selection: $inputUnit) {
                        
                        ForEach(0 ..< unit.count) {
                            Text("\(self.unit[$0].string())")
                        }
                    }
                    Picker("Measurement", selection: $inputMeasurement) {
                        ForEach (0 ..< unit[self.inputUnit].getArray().count) {
                            Text("\(self.unit[self.inputUnit].getArray()[$0].capitalized)")
                        }
                        
                        }.id(UUID())
                    
                    TextField("Enter value", text: $inputValue)
                        .keyboardType(.decimalPad)

                        
                }
                Section(header: Text("Output")){
                    
                    Picker("Unit", selection: $outputUnit){
                        ForEach(0 ..< unit.count){
                            Text("\(self.unit[$0].string())")
                        }
                    }
                    Picker("Measurement", selection: $outputMeasurement) {
                        ForEach (0 ..< unit[self.outputUnit].getArray().count) {
                            Text("\(self.unit[self.outputUnit].getArray()[$0].capitalized)")
                        }
                        
                    }.id(UUID())
                    
                    Text("\(result, specifier: "%.2f")")
                    
                }
                
            }
            
             .navigationBarTitle("Unit Conversion", displayMode: .inline)

        }
        


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
