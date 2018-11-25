//
//  Teacher.swift
//  第八次作业
//
//  Created by student on 2018/11/22.
//  Copyright © 2018年 student. All rights reserved.
//

import Foundation

class Teacher: Person {
    var title: String
    init(firstName: String, lastName: String, age: Int, gender: Gender, title: String) {
        self.title = title
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    convenience init(name: String){
        self.init(firstName: name, lastName: "", age: 18, gender: Gender.female, title: "")
    }
    override var description: String{
        return super.description + " title:\(title)"
    }
}
