//
//  CarCustomiserTests.swift
//  CarCustomiserTests
//
//  Created by Tomas Lopez-Valcarcel on 18/01/2024.
//

import XCTest

final class CarCustomiserTests: XCTestCase {

    func testNewCarGivesMeACarWithAllAttributesSet() {
        //arrange
        //act
        let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
        //assert
        XCTAssertEqual(car.make, "Mazda")
        XCTAssertEqual(car.model, "MX-5")
        XCTAssertEqual(car.topSpeed, 125)
        XCTAssertEqual(car.acceleration, 7.7)
        XCTAssertEqual(car.handling, 5)
    }
    func testCarStatsDisplay(){
        let statsDisplay = """
                Make: Mazda
                Model: MX-5
                Top Speed: 125mph
                Acceleration (0-60 in): 7.7s
                Handling: 5
                """
    }

}

//cmd shift k
//cmd u
