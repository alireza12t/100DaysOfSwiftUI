//
//  ContentView.swift
//  Challenge1
//
//  Created by ali on 7/17/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MeasureViewModel
    
    @State private var inputUnit: Unit = .Meters
    @State private var outputUnit: Unit = .Meters
    
    let units: [Unit] = [.Meters, .Kilometers, .Feet, .Yards, .Miles]
    
    init(viewModel: MeasureViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input")) {
                    TextField("Enter input Amount", text: $viewModel.inputString)
                    
                    Picker("Input Unit", selection: $viewModel.inputUnit) {
                        ForEach(0 ..< units.count) {
                            Text("\(self.units[$0].rawValue)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Output")) {
                    Picker("Output Unit", selection: $viewModel.outputUnit) {
                        ForEach(0 ..< units.count) {
                            Text("\(self.units[$0].rawValue)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Result")) {
                    Text("\(self.viewModel.output.value, specifier: "%.2f")")
                        +
                        Text("\(viewModel.outputUnit.rawValue)")
                }
            }
            .navigationTitle("Length Conversion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MeasureViewModel(inputAmount: 12.5, .Meters)
        ContentView(viewModel: viewModel)
    }
}
