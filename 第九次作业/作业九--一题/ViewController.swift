//
//  ViewController.swift
//  作业九
//
//  Created by student on 2018/11/10.
//  Copyright © 2018年 zw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func addLable(_ sender: Any) {
        let x = Int(arc4random()) % Int(view.bounds.width)
        let y = Int(arc4random()) % Int(view.bounds.height)
        
        let lable = UILabel(frame: CGRect(x: x, y: y, width: 30, height: 30))
        lable.text = "A"
        lable.textAlignment = .center
        lable.backgroundColor = UIColor.red
        
        //阴影
        lable.layer.shadowColor = UIColor.gray.cgColor
        lable.layer.shadowOffset = CGSize(width: 5, height: 5)
        lable.layer.shadowOpacity = 1
        
        view.addSubview(lable)
        
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan(recognizer:)))
        lable.addGestureRecognizer(panRecognizer)
        lable.isUserInteractionEnabled = true
    }
    
    //移动
    @objc func pan(recognizer: UIPanGestureRecognizer) {
        
        switch recognizer.state {
        case .changed:
            fallthrough
        case .ended:
            let translation = recognizer.translation(in: self.view)
            recognizer.view?.center.x += translation.x
            recognizer.view?.center.y += translation.y
            recognizer.setTranslation(.zero, in: self.view)
        default:
            break
        }
        
    }
    
    @IBAction func moveLable(_ sender: Any) {
        for label in view.subviews {
            if label is UILabel {
                UIView.animate(withDuration: 1) {
                    let x = Int(arc4random()) % Int(self.view.bounds.width)
                    let y = Int(arc4random()) % Int(self.view.bounds.height)
                    label.center.x = CGFloat(x)
                    label.center.y = CGFloat(y)
                }
                
            }
        }
    }
    
    @IBAction func deleteLable(_ sender: Any) {
        for label in view.subviews {
            if label is UILabel {
                label.removeFromSuperview()
            }
        }
                
    }
    
    
}

