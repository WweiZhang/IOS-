//
//  Student.swift
//  第八次作业
//
//  Created by student on 2018/11/22.
//  Copyright © 2018年 student. All rights reserved.
//

import Foundation
class Student: Person {
    var stuNo:String
    init(firstName: String, lastName: String, age: Int, gender: Gender, stuNo: String) {
        self.stuNo = stuNo
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    convenience init(name: String){
        self.init(firstName: name, lastName: "", age: 18, gender: Gender.female, stuNo: "2016110400")
    }
    override var description: String{
        return super.description + " stuNo:\(stuNo)"
    }
}
