//
//  ViewController.swift
//  AFNSwift
//
//  Created by 谢臣 on 2020/10/13.
//  Copyright © 2020 谢臣. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let parameters = ["cityname":"沈阳","dtype":"json","key":"12956f8b2656aeaea2593a5510426ab3"]
        NetworkTools.sharedTools.request(method:AFNRequestMethod.GET,URLString: "http://v.juhe.cn/weather/index", parameters: parameters as [String : AnyObject] , headers: nil){
            (result,error) ->() in
            
            print(result!)
            
        }
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
        
        
    }
}

