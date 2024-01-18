//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Tomas Lopez-Valcarcel on 18/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    let car = Car(Make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7 handling: 5)
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(Car.statsDisplay())
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
