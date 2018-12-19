//
//  WeatherDetailViewController.swift
//  MyWeatherJson
//
//  Created by yangmiao on 2018/12/18.
//  Copyright © 2018年 zw. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var shiduLabel: UILabel!
    var weather:Weather?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.update()
        // Do any additional setup after loading the view.
    }
    func update(){
        timeLabel.text = weather?.time
        shiduLabel.text = weather?.shidu
        cityLabel.text = weather?.city
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
