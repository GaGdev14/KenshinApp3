//
//  VCRegisterValues.swift
//  KenshinApp3
//
//  Created by MaiInagaki on 2018/11/12.
//  Copyright © 2018年 GaGdev14. All rights reserved.
//

import UIKit

class VCRegisterValues: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var inputValue: UITextField!
    
    @IBAction func closePage(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var message: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //数字のキーボードを表示する
        self.inputValue.keyboardType = UIKeyboardType.numberPad
        
        message.isHidden = true
        
        
    }
    
    func tapCloseKeyBoard(){
     //message.isHidden = false
     print("Doneボタン押下")
    }
    
    
    
}
