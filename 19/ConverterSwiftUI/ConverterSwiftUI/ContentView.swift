//
//  ContentView.swift
//  ConverterSwiftUI
//
//  Created by Maksim Nosov on 18.12.2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNumber = ""
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    let unitList = ["секунды", "минуты", "часы", "дни"]
    
    var fromValueInSeconds: Double {
        let inputNumberLocal = Double(inputNumber) ?? 0
        var outputValue: Double = 0.0
        
        switch inputUnit {
        case 0:
            outputValue = inputNumberLocal
        case 1:
            outputValue = inputNumberLocal * 60
        case 2:
            outputValue = inputNumberLocal * 60 * 60
        case 3:
            outputValue = inputNumberLocal * 60 * 60 * 24
        default:
            break
        }
        
        print(outputValue)
        return outputValue
    }
    
    var toValue: Double {
        var outputValue: Double = 0.0
        
        switch outputUnit {
        case 0:
            outputValue = fromValueInSeconds
        case 1:
            outputValue = fromValueInSeconds / 60
        case 2:
            outputValue = fromValueInSeconds / 60 / 60
        case 3:
            outputValue = fromValueInSeconds / 60 / 60 / 24
        default:
            break
        }
        
        return outputValue
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Значение")) {
                    TextField("Введите значение для конвертации", text: $inputNumber)
                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("Конвертировать из")) {
                    Picker("Из", selection: $inputUnit) {
                        ForEach(0 ..< unitList.count) {
                            Text("\(self.unitList[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("В единицу измерения")) {
                    Picker("В", selection: $outputUnit) {
                        ForEach(0 ..< unitList.count) {
                            Text("\(self.unitList[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Итоговое значение")) {
                    Text("\(toValue, specifier: "%.3f")")
                }
            }.navigationBarTitle("Конвертер измерений")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
