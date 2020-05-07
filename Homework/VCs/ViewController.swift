//
//  ViewController.swift
//  Homework
//
//  Created by 廖健宇 on 2020/2/26.
//  Copyright © 2020 Billy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate lazy var timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        formatter.dateFormat = "HH:mm a"
        return formatter
    }()
    
    @IBOutlet weak var btn_clock: UIButton!
    @IBAction func btn_clock(_ sender: UIButton) {
        if Global.status == 0 {
            Global.clockIn = timeFormatter.string(from: Date())
        }else if Global.status == 2{
            Global.clockOut = timeFormatter.string(from: Date())
        }
        Global.status += 1
        jumpToNext()
    }
    
    @IBOutlet weak var position_name: UILabel!
    @IBOutlet weak var client_name: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var manager_name: UILabel!
    @IBOutlet weak var manager_phone: UILabel!
    @IBOutlet weak var wage_amount: UILabel!
    @IBOutlet weak var wage_type: UILabel!
    @IBOutlet weak var clockIn: UILabel!
    @IBOutlet weak var clockOut: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setButton()
        self.setInfo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        btn_clock.setTitle(Global.checkStatus(index : Global.status), for: .normal)
        if Global.status == 2 {
            clockIn.text = timeFormatter.string(from: Date())
        }else if Global.status == 4{
            clockOut.text = timeFormatter.string(from: Date())
            btn_clock.isHidden = true
        }
    }

    func setButton(){
        btn_clock.setTitle(Global.checkStatus(index : Global.status), for: .normal)
        btn_clock.layer.borderWidth = 17.13
        btn_clock.layer.borderColor = UIColor(named: "main tone")?.cgColor
    }
    
    func setInfo(){
        position_name.text = Global.position_name!
        client_name.text = Global.client_name!
        address.text = Global.address!
        manager_name.text = Global.manager_name!
        manager_phone.text = Global.manager_phone!
        wage_type.text = Global.wage_type!
        
        let amount = Float(Global.wage_amount!)
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        
        let a = formatter.string(for: amount!)
        wage_amount.text = "Rp " + a!
    }
    
    func jumpToNext(){
        let controller = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CancelationVC")
        present(controller, animated: true, completion: nil)
    }
}
