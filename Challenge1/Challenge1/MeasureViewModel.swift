//
//  MeasureViewModel.swift
//  Challenge1
//
//  Created by ali on 7/17/20.
//

import Foundation



import SwiftUI
import Combine

class MeasureViewModel: ObservableObject, Identifiable {
    ///input is in Meter Unit
    @Published var inputString: String = ""
    @Published var amount: Measurement = Measurement(value: 0, unit: UnitLength.meters)
    @Published var outputUnit: Unit = Unit.Meters
    @Published var inputUnit: Unit = Unit.Meters
    
    
    init(inputAmount: Double,_ unit: Unit = .Meters) {
        setInput(amount: inputAmount, unit: unit)
    }
    
    func setInput(amount: Double, unit: Unit) {
        switch unit {
        case .Meters:
            self.amount = Measurement(value: amount, unit: UnitLength.meters)
        case .Kilometers:
            self.amount = Measurement(value: amount, unit: UnitLength.kilometers)
        case .Feet:
            self.amount = Measurement(value: amount, unit: UnitLength.feet)
        case .Yards:
            self.amount = Measurement(value: amount, unit: UnitLength.yards)
        case .Miles:
            self.amount = Measurement(value: amount, unit: UnitLength.miles)
        }
    }
    
    var output: Measurement<UnitLength> {
        get {
            let inputValue = Double(inputString) ?? 0
            setInput(amount: inputValue, unit: inputUnit)
            switch outputUnit {
            case .Meters:
                return self.amount.converted(to: .meters)
            case .Kilometers:
                return self.amount.converted(to: .kilometers)
            case .Feet:
                return self.amount.converted(to: .feet)
            case .Yards:
                return self.amount.converted(to: .yards)
            case .Miles:
                return self.amount.converted(to: .miles)
            }
        }
    }
}


extension MeasureViewModel {
    var resultView: some View {
        return Text("\(self.output.value, specifier: "%.2f")")
    }
}
