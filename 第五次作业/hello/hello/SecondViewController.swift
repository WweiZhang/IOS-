//
//  SecondViewController.swift
//  hello
//
//  Created by student on 2018/10/17.
//  Copyright © 2018年 12. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = UIColor.green
        let imageView = UIImageView(frame: CGRect(x: 0, y: 100, width: 400, height: 400))
        imageView.image = UIImage(named: "phone")
        view.addSubview(imageView)
        // Do any additional setup after loading the view.
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 1000))
        //button.backgroundColor = UIColor.red
        button.setTitle("click me", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        view.addSubview(button)
        button.addTarget(self, action: #selector(imgClicked), for: .touchUpInside)
    }
    
    @IBAction func imgClicked() {
        //        if let label.text = view.subviews.first as? UILabel {
        //label.text = "I am clicked"
        //        }
        present(FirstViewController(),animated: true,completion: nil)
        print("I am clickedd")
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
