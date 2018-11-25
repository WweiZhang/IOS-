//
//  Person.swift
//  第八次作业
//
//  Created by student on 2018/11/22.
//  Copyright © 2018年 student. All rights reserved.
//

import Foundation

enum Gender {
    case male
    case female
}

class Person {
    var firstName:String
    var lastName:String
    var age:Int
    var gender:Gender
    var fullName:String{
        get{
            return firstName+" "+lastName
        }
    }
    init(firstName:String, lastName:String, age:Int, gender:Gender) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
    }
    convenience init(name:String){
        self.init(firstName: name, lastName: "", age: 18, gender: Gender.female)
    }
    
    var description:String {
        return "Name:\(fullName) Age:\(age) Gender:\(gender)"
    }
    static func ==(p1:Person,p2:Person) -> Bool {
        return p1.fullName == p2.fullName
    }
}
