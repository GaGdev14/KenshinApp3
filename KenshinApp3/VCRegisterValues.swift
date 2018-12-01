//
//  VCRegisterValues.swift
//  KenshinApp3
//
//  Created by MaiInagaki on 2018/11/12.
//  Copyright © 2018年 GaGdev14. All rights reserved.
//

import UIKit

class VCRegisterValues: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var lastMonthValue: UILabel!
    @IBOutlet weak var inputValue: UITextField!
    
    @IBAction func closePage(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var message: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //入力ボックスのデフォルト値（うっすら表示する文字）
        inputValue.placeholder = "入力してください"
        
        //数字のキーボードを表示する
        self.inputValue.keyboardType = UIKeyboardType.numberPad

        message.isHidden = true
        
    }
    
    @IBAction func registerValue(_ sender: Any) {
        print("ボタン押下")
    }
    
}
