//
//  TestStudent.swift
//  FebOneUnitTestingTests
//
//  Created by thusitha on 2/1/20.
//  Copyright © 2020 nibm. All rights reserved.
//

//change for commit

import XCTest
@testable import FebOneUnitTesting

class TestStudent: XCTestCase {
    
    func testValidFirstName () {
        
        let student = Student(firstName: "Si", lastName: "Kumara")
        
        XCTAssertTrue(student.validFirstName())
    }
    
    func testValidLastName () {
        let student = Student(firstName: "Si", lastName: "Kumara")
        
        XCTAssertTrue(student.validLastName())
    }
    
    func testAddFriend() {
        let sirisena = Student(firstName: "Sirisena", lastName: "Kumara")
        let kuru = Student(firstName: "Kuru", lastName: "Nimal")
        
        XCTAssertTrue(sirisena.friends.count == 0)
        
        sirisena.addFriend(friend: kuru)
        
        XCTAssertTrue(sirisena.friends.count == 1)
    }
}
