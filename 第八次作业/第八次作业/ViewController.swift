//
//  ViewController.swift
//  第八次作业
//
//  Created by student on 2018/11/22.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
 
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var chooseLabel: UILabel!
    
    @IBOutlet weak var perTableView: UITableView!
    var personArray = [Person]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        personArray.append(Student(firstName: "z", lastName: "w123456789", age: 18, gender: Gender.female, stuNo: "2016110452"))
        personArray.append(Student(firstName: "w", lastName: "jc", age: 18, gender: Gender.male, stuNo: "2016110452"))
        personArray.append(Student(firstName: "z", lastName: "wy", age: 18, gender: Gender.female, stuNo: "2016110452"))
        personArray.append(Student(firstName: "y", lastName: "m", age: 18, gender: Gender.female, stuNo: "2016110452"))
        
        personArray.append(Teacher(firstName: "li", lastName: "guiyang", age: 30, gender: Gender.male, title: "12345"    ))
        personArray.append(Teacher(firstName: "zhang", lastName: "lu", age: 30, gender: Gender.male, title: "12345"    ))
        personArray.append(Teacher(firstName: "xia", lastName: "yu", age: 30, gender: Gender.male, title: "12345"    ))
        
    }
    //  按钮
    @IBAction func addClicked(_ sender: Any) {
        if let name = nameTextField.text {
            personArray.append(Student(name: name))
            perTableView.reloadData()
        }
        nameTextField.resignFirstResponder()
    }
    
    
    @IBAction func editClicked(_ sender: Any) {
        if let row = perTableView.indexPathForSelectedRow?.row {
            if let name = nameTextField.text {
                personArray[row] = Student(name: name)
                perTableView.reloadData()
            }
            
        }
    }
    
    @IBAction func deleteClicked(_ sender: Any) {
        perTableView.isEditing = !perTableView.isEditing
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let stuCell = tableView.dequeueReusableCell(withIdentifier: "StudentCell") as! StudentTableViewCell
        let teaCell = tableView.dequeueReusableCell(withIdentifier: "TeacherCell") as! TeacherTableViewCell
        let person = personArray[indexPath.row]
        if person is Teacher {
            let tea = person as! Teacher
            teaCell.name.text = tea.fullName
            teaCell.name.sizeToFit()
            
            teaCell.age.text = "age: \(tea.age)"
            teaCell.age.sizeToFit()
            
            teaCell.gender.text = "\(tea.gender)"
            teaCell.gender.sizeToFit()
            
            teaCell.title.text = "\(tea.title)"
            teaCell.title.sizeToFit()
            
            return teaCell
            
        
        } else{
            let stu = person as! Student
            stuCell.name.text = stu.fullName
            stuCell.name.sizeToFit()
            
            stuCell.age.text = "age: \(stu.age)"
            stuCell.age.sizeToFit()
            
            stuCell.gender.text = "\(stu.gender)"
            stuCell.gender.sizeToFit()
            
            stuCell.stuNo.text = "\(stu.stuNo)"
            stuCell.stuNo.sizeToFit()
            return stuCell
        }
      
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chooseLabel.text = "You choose: \(personArray[indexPath.row].fullName)"
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            personArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let source = personArray.remove(at: sourceIndexPath.row)
        personArray.insert(source, at: destinationIndexPath.row)
    }
}

