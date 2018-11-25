//
//  CircleView.swift
//  作业九
//
//  Created by student on 2018/11/10.
//  Copyright © 2018年 zw. All rights reserved.
//

import UIKit

@IBDesignable
class CircleView: UIView {

    @IBInspectable var fillcolor: UIColor?
    @IBInspectable var strokecolor: UIColor?
    
    func setup() {
        //移动
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan(recognizer:)))
        self.addGestureRecognizer(panRecognizer)
        //缩放
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(recognizer:)))
        self.addGestureRecognizer(tapRecognizer)
        
        //
        let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(pinch(recognizer:)))
        self.addGestureRecognizer(pinchRecognizer)
        tapRecognizer.numberOfTouchesRequired = 1
        tapRecognizer.numberOfTapsRequired = 2
        
        
    }
    //移动
    @objc func pan(recognizer: UIPanGestureRecognizer) {
        
        switch recognizer.state {
        case .changed:
            fallthrough
        case .ended:
            let translation = recognizer.translation(in: self)
            center.x += translation.x
            center.y += translation.y
            recognizer.setTranslation(.zero, in: self)
        default:
            break
        }
        
    }
    //缩放
    @objc func pinch(recognizer: UIPinchGestureRecognizer) {
        switch recognizer.state {
        case .changed:
            fallthrough
        case .ended:
            bounds.size = CGSize(width: bounds.width * recognizer.scale, height: bounds.height * recognizer.scale)
            recognizer.scale = 1
        default:
            break
        }
        
    }
    //
    @objc func tap(recognizer: UITapGestureRecognizer) {
        switch recognizer.state {
        case .recognized:
            print("dos")
        default:
            break
        }
        
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let path = UIBezierPath(ovalIn: rect)
        fillcolor?.setFill()
        strokecolor?.setStroke()
        path.fill()
        path.stroke()
    }
 

}
