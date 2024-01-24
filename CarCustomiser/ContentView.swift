//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Tomas Lopez-Valcarcel on 18/01/2024.
//

import SwiftUI
struct ContentView: View {
    @State private var starterCars = StarterCars()
    
    @State private var selectedCar: Int = 0
    
    @State private var exhaustPackage = false
    @State private var tiresPackage = false
    @State private var sportsPackage = false

    
    @State private var balance = 1125

    var exhaustPackageEnabled: Bool{
        if self.exhaustPackage == true{
            return true
        } else if balance >= 500 && self.exhaustPackage == false{
            return true
        } else{
            return false
        }
    }
    var tiresPackageEnabled: Bool{
        if self.tiresPackage == true{
            return true
        } else if balance >= 600 && self.tiresPackage == false{
            return true
        } else{
            return false
        }
    }
    var sportsPackageEnabled: Bool{
        if self.sportsPackage == true{
            return true
        } else if balance >= 650 && self.sportsPackage == false{
            return true
        } else{
            return false
        }
    }
    
    
    var body: some View {
        let exhaustPackageBinding = Binding<Bool> (
            get: {self.exhaustPackage},
            set: {newValue in
                self.exhaustPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 5
                    balance -= 500
                } else{
                    starterCars.cars[selectedCar].topSpeed -= 5
                    balance += 500
                }
            }
        )
        let tiresPackageBinding = Binding<Bool> (
            get: {self.tiresPackage},
            set: {newValue in
                self.tiresPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].handling += 2
                    balance -= 600
                } else{
                    starterCars.cars[selectedCar].handling -= 2
                    balance += 600
                }
            }
        )
        let sportsPackageBinding = Binding<Bool> (
            get: {self.sportsPackage},
            set: {newValue in
                self.sportsPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].acceleration -= 1
                    balance -= 750
                } else{
                    starterCars.cars[selectedCar].acceleration += 1
                    balance += 750
                }
            }
        )
        VStack{
            Form{
                VStack(alignment: .leading, spacing: 20){
                    Text(starterCars.cars[selectedCar].statsDisplay())
                    Button("Next car", action: {
                        if selectedCar == starterCars.cars.count-1{
                            selectedCar = 0
                            resetDisplay()
                        }
                        else{
                            selectedCar += 1
                            resetDisplay()
                        }
                    })
                }
                Section{
                    Toggle("Exhaust Package (Cost: 500)", isOn: exhaustPackageBinding)
                        .disabled(!exhaustPackageEnabled)
                    Toggle("Tires Package (Cost: 600)", isOn: tiresPackageBinding)
                        .disabled(!tiresPackageEnabled)
                    Toggle("Sports Package (Cost: 750)", isOn: sportsPackageBinding)
                    .disabled(!sportsPackageEnabled)}
            }
                Text("Balance: \(balance)")
                    .foregroundColor(.red)
                    .baselineOffset(20)
            
        }
    }
    func resetDisplay(){
        balance = 1000
        exhaustPackage = false
        tiresPackage = false
        sportsPackage = false
        starterCars = StarterCars()
    }
}


#Preview {
    ContentView()
}
