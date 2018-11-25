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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //数字のキーボードを表示する
        self.inputValue.keyboardType = UIKeyboardType.numberPad
        
    
    }
    
}
