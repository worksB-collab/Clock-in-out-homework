//
//  CancelationVC.swift
//  Homework
//
//  Created by 廖健宇 on 2020/2/26.
//  Copyright © 2020 Billy. All rights reserved.
//

import UIKit

class CancelationVC: UIViewController {

    var timer : Timer?
    var progress = 0
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBAction func btn_cancel(_ sender: UIButton) {
        self.timer!.invalidate()
        Global.status -= 1
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStatus()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setTimer()
    }
    
    func setStatus(){
        status.text = Global.checkStatus(index: Global.status)
    }
    
    func setTimer(){
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(progressAdding), userInfo: nil, repeats: true)
    }
    
    @objc func progressAdding(){
        if progressBar.progress == 1{
            if self.timer != nil {
                self.timer!.invalidate()
            }
            clockAPI(index : Global.status)
            Global.status += 1
            dismiss(animated: true, completion: nil)
        }
        progressBar.progress += 0.1
        progressBar.reloadInputViews()
    }
    
    func clockAPI(index : Int){
        var api = "/staff-requests/26074/"
        if index == 1{
            api += "clock-in/"
        }else if index == 3{
            api += "clock-out/"
        }
        print("latitude" + Global.latitude!)
        print("longitude" + Global.longitude!)
        print("api" + api)
        
        if let latitude = Global.latitude{
            if let longitude = Global.longitude{
                NetWorkController.sharedInstance.postT(api: api, params: ["latitude": latitude, "longitude": longitude])
                {(jsonData) in
                    print("dsds" + jsonData.debugDescription)
                }
            }
        }
    }
}



