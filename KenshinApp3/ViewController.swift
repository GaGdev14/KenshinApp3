//
//  ViewController.swift
//  KenshinApp3
//
//  Created by 1490402 on 2018/11/06.
//  Copyright © 2018年 GaGdev14. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var password: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let context = LAContext()
        var error : NSError?
        if context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "サンプル確認のための認証チェック", reply: {
                success, error in
                if (success) {
                    NSLog("認証成功")
                    self.performSegue(withIdentifier: "toCustomer", sender: nil)
                    
                } else {
                    NSLog("認証失敗：" + error!._code.description)
                }
            })
        } else {
            NSLog("TouchID非対応")
        }
        
        id.placeholder = "ID"
        password.placeholder = "Password"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
