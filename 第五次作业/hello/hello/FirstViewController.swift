//
//  FirstViewController.swift
//  hello
//
//  Created by student on 2018/10/17.
//  Copyright © 2018年 12. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.yellow
        label = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 100))
        label.text = "hello world"
        label.textAlignment = .center
        label.backgroundColor = UIColor.blue
        self.view.addSubview(label)
        // Do any additional setup after loading the view.
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 800))
        button.setTitle("click me", for: .normal)
        //button.setTitle("I am happy", for: .highlighted)
        button.setTitleColor(UIColor.green, for: .normal)
        view.addSubview(button)
        button.addTarget(self, action: #selector(btuClicked), for: .touchUpInside)
//        print("first view)
    }
    
    @IBAction func btuClicked() {
//        if let label.text = view.subviews.first as? UILabel {
        label.text = "I am clicked"
//        }
        present(SecondViewController(),animated: true,completion: nil)
        print("I am clicked")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
