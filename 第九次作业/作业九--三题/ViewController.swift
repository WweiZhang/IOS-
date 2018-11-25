//
//  ViewController.swift
//  作业九--三题
//
//  Created by student on 2018/11/10.
//  Copyright © 2018年 zw. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
   
    @IBOutlet weak var scrollView2: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
/*****************/
        for i in 1...7 {
            let imageView = UIImageView(image: UIImage(named: "\(i)"))
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: CGFloat(i-1) * scrollView.bounds.width, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
            scrollView.addSubview(imageView)
            scrollView.isPagingEnabled = true
        }
        
        scrollView.contentSize = CGSize(width: 7 * scrollView.bounds.width, height: scrollView.bounds.height)
//        scrollView.minimumZoomScale = 0.2
//        scrollView.maximumZoomScale = 5
        scrollView.delegate = self

        pageControl.numberOfPages = 6
        pageControl.currentPage = 0
        pageControl.isUserInteractionEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        
/**************缩放***********/
        
        let imageView2 = UIImageView(image: UIImage(named: "1"))
        
        scrollView2.addSubview(imageView2)
        scrollView2.contentSize = imageView2.bounds.size
        scrollView2.minimumZoomScale = 0.2
        scrollView2.maximumZoomScale = 5
        scrollView2.delegate = self
       
    }
    //pagecontrol进行提示
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
       pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.width)
    }

    @IBAction func pageControlClicked(_ sender: Any) {
        let rect = CGRect(x: CGFloat(pageControl.currentPage) * scrollView.bounds.width, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
        scrollView.scrollRectToVisible(rect, animated: true)
    }
    
      // 手势缩放
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return scrollView2.subviews.first
    }

}

