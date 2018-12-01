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
    
    @IBOutlet weak var UsageOfLastYear: UILabel!
    
    @IBAction func closePage(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var message: UILabel!
    
    var registerFlag: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //入力ボックスのデフォルト値（うっすら表示する文字）
        inputValue.placeholder = "入力してください"
        
        //数字のキーボードを表示する
        self.inputValue.keyboardType = UIKeyboardType.numberPad

        message.isHidden = true
        
        //ここで値代入。今は仮の値
        var lastMonthValueInt: Int = 1111
        var UsageOfLastYearInt: Int = 45
        
        lastMonthValue.text = String(lastMonthValueInt)
        UsageOfLastYear.text = String(UsageOfLastYearInt)
        
        
    }
    
    @IBAction func registerValue(_ sender: Any) {
        print("ボタン押下")
        if (registerFlag == 0){
            message.isHidden = false
            print(registerFlag)
            registerFlag = registerFlag + 1
        }else{
            print("登録処理実施")
            print(registerFlag)
            //登録処理

        }
    }
    
}
