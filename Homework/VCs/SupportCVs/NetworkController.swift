//
//  NetworkController.swift
//  Homework
//
//  Created by 廖健宇 on 2020/2/26.
//  Copyright © 2020 Billy. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class NetWorkController: NSObject {
    static let rootUrl : String = "https://api.helpster.tech/v1"
    
    static let sharedInstance = NetWorkController()
    
    var alamofireManager = AF
    
    fileprivate override init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = 20
        
    }
    
    func postLogin(api : String, params : Dictionary<String, Any>, callBack:((JSON) -> ())?){
        alamofireManager.request(NetWorkController.rootUrl + api, method: .post, parameters: params, encoding: JSONEncoding.default, headers: [:])
            .validate(statusCode: 200 ..< 500).responseJSON
            {
                (response) in
                    let jsonData = try! JSON(data: response.data!)
                    callBack?(jsonData)
            }
    }
    
    func postT(api : String, params : Dictionary<String, Any>, callBack:((JSON) -> ())?){
        alamofireManager.request(NetWorkController.rootUrl + api, method: .post, parameters: params, encoding: JSONEncoding.default, headers: ["Authorization" : Global.token!])
                .validate(statusCode: 200 ..< 500).responseJSON
                {
                    (response) in
                    print("response" + response.debugDescription)
                    let jsonData = try! JSON(data: response.data!)
                    callBack?(jsonData)
                }
        }

    func get(api : String, callBack:((JSON) -> ())?){
            alamofireManager.request(NetWorkController.rootUrl + api, encoding: JSONEncoding.default, headers: [ "Authorization" : Global.token! ]).validate(statusCode: 200 ..< 500).responseJSON
                {
                    (response) in
                    let jsonData = try! JSON(data: response.data!)
                    callBack?(jsonData)
                }
        }
    
    
}
