//
//  secondViewController.swift
//  作业11--一题
//
//  Created by student on 2018/12/12.
//  Copyright © 2018年 2016110452. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {

    var name = ""
    var no = ""
    
    var delegate: StudentProtocol?
    
    @IBOutlet weak var tfNo: UITextField!
    @IBOutlet weak var tfName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        tfNo.text = no
        tfName.text = name
        // Do any additional setup after loading the view.
        
        }

    @IBAction func back(_ sender: Any) {
        no = tfNo.text!
        name = tfName.text!
        
        delegate?.change(name: name, no: no)
        
        navigationController?.popViewController(animated: true)
    }
}
