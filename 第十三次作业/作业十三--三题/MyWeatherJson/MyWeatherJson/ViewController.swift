//
//  ViewController.swift
//  MyWeatherJson
//
//  Created by yangmiao on 2018/12/18.
//  Copyright © 2018年 zw. All rights reserved.
//

import UIKit
import Alamofire
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
  let citise = ["北京": 101010100, "上海": 101020100, "天津": 101030100, "重庆": 101040100, "哈尔滨": 101050101, "长春": 101060101, "沈阳": 101070101, "呼和浩特": 101080101, "石家庄": 101090101, "太原": 101100101, "西安": 101110101, "济南": 101120101, "乌鲁木齐": 101130101, "拉萨": 101140101, "西宁": 101150101, "兰州": 101160101, "银川": 101170101, "郑州": 101180101, "南京": 101190101, "武汉": 101200101, "杭州": 101210101, "合肥": 101220101, "福州": 101230101, "南昌": 101240101, "长沙": 101250101, "贵阳": 101260101, "成都": 101270101, "广州": 101280101, "昆明": 101290101, "南宁": 101300101, "海口": 101310101, "香港": 101320101, "澳门": 101330101, "台北县": 101340101]
   var weather = Weather()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citise.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = Array(citise.keys)[indexPath.row]
        cell.detailTextLabel?.text = "\(Array(citise.values)[indexPath.row])"
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let secVc = segue.destination as? WeatherDetailViewController{
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell){
                let number = "\(Array(citise.values)[indexPath.row])"
                let myurl = "http://t.weather.sojson.com/api/weather/city/\(number ?? "101270101")"
                let url = URL(string: myurl)!
                print(url)
                AF.request(url).responseJSON{
                    (response) in
                    let json = response.result.value as! Dictionary<String,AnyObject>
                    self.weather.time = json["time"] as! String
                    let data = json["data"] as! Dictionary<String,AnyObject>
                    self.weather.shidu = data["shidu"] as! String
                    let cityInfo = json["cityInfo"] as! Dictionary<String,AnyObject>
                    self.weather.city = cityInfo["city"] as! String
                }
                secVc.weather = weather
            }
        }
        
    }
}

