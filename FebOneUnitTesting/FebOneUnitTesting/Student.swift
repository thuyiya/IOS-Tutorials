//
//  Student.swift
//  FebOneUnitTesting
//
//  Created by thusitha on 2/1/20.
//  Copyright © 2020 nibm. All rights reserved.
//

class Student {
    private let firstName: String
    private let lastName: String
    var friends: [Student] = []
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }

    func addFriend(friend: Student) {
        friends.append(friend)
    }
    
    func validFirstName() -> Bool {
        return firstName.count > 3
    }
    
    func validLastName() -> Bool {
        return lastName.count > 3
    }
}
