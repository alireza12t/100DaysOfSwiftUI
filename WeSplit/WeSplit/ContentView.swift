//
//  ContentView.swift
//  WeSplit
//
//  Created by ali on 7/14/20.
//
import SwiftUI

struct ContentView: View {
    @State private var checkAmount: String = ""
    @State private var tipPercentage: Int = 2
    @State private var numberOfPeople: Int = 2
    
    let tipPercentages: [Int] = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0

        let tipVale = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipVale
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form{
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section(header: Text("How much do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0]) %")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Text("$  \(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
//            ContentView()
//                .preferredColorScheme(.dark)
        }
    }
}
