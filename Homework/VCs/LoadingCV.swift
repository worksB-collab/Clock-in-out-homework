//
//  LoadingCV.swift
//  Homework
//
//  Created by 廖健宇 on 2020/2/26.
//  Copyright © 2020 Billy. All rights reserved.
//

import UIKit

class LoadingCV: UIViewController {

    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loading.startAnimating()
        getInfoFromAPI()
    }
    
    func getInfoFromAPI(){
        NetWorkController.sharedInstance.postLogin(api: "/auth/login/", params: ["username": Global.username, "password": Global.password])
        {(jsonData) in
                let token = jsonData["key"].string
            Global.token = "token " + token!
            
            if Global.token != nil{
                
                NetWorkController.sharedInstance.get(api: "/staff-requests/26074/")
                {(jsonData) in
                    
                    Global.wage_amount = jsonData["wage_amount"].string
                    Global.wage_type = jsonData["wage_type"].string
                   
                    //client info
                    Global.client_name =  jsonData["client"].dictionary!["name"]?.string
                    
                    
                    //location info
                    let location = jsonData["location"].dictionary!["address"]?.dictionary
                    Global.address = location!["street_1"]?.string
                    Global.latitude = "\(location!["latitude"]!.double!)"
                    Global.longitude = "\(location!["longitude"]!.double!)"
                   
                    //manager info
                    Global.manager_name =  jsonData["manager"].dictionary!["name"]?.string
                    Global.manager_phone = jsonData["manager"].dictionary!["phone"]?.string
                    
                    //position info
                    Global.position_name = jsonData["position"].dictionary!["name"]?.string
                    self.jumpToNext()
                }
            }
        }
    }
    func jumpToNext(){
        let controller = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController")
        present(controller, animated: true, completion: nil)
    }
}
