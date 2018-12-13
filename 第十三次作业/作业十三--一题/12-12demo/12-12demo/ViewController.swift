//
//  ViewController.swift
//  12-12demo
//
//  Created by student on 2018/12/12.
//  Copyright © 2018年 2016110452. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sumlabel: UILabel!
    @IBOutlet weak var countlabel: UILabel!
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            self.count += 1
            self.countlabel.text = "计时：\(self.count)"
            //            print("timer thread:\(Thread.current)")
            }.fire()
    }

    @IBAction func sum(_ sender: Any) {
        var sum = 0
        DispatchQueue.global().async {
            for i in 1...9999999 {
                sum += i
            }
            DispatchQueue.main.async {
                self.sumlabel.text = "计算结果：\(sum)"
            }
            
        }
    }
    
    

}

