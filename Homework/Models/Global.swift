//
//  Global.swift
//  Homework
//
//  Created by 廖健宇 on 2020/2/26.
//  Copyright © 2020 Billy. All rights reserved.
//

import Foundation

public class Global{
    
    public static var token : String?
    public static let username = "+6281313272005"
    public static let password = "alexander"
    
    public static var position_name : String?
    public static var client_name : String?
    public static var wage_amount : String?
    public static var wage_type : String?
    public static var address : String?
    public static var latitude : String?
    public static var longitude : String?
    public static var manager_name : String?
    public static var manager_phone : String?
    public static var clockIn = "-"
    public static var clockOut = "-"
    
    
    public static var status = 0
    
    public static func checkStatus (index : Int)-> String{
        switch index {
        case 1:
            return "Clocking in..."
        case 2:
            return "Clock out"
        case 3:
            return "Clocking out..."
        default:
            return "Clock in"
        }
    }
    
}
