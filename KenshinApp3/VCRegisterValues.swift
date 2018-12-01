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
    
    @IBOutlet weak var usageOfLastYear: UILabel!
    
    @IBOutlet weak var usageThisYear: UILabel!
    
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
        var usageOfLastYearInt: Int = 45
        
        lastMonthValue.text = String(lastMonthValueInt)
        usageOfLastYear.text = String(usageOfLastYearInt)
        
        
    }
    
    @IBAction func registerValue(_ sender: Any) {
        print("ボタン押下")
        var check:Bool = false
        check = inputCheck()
        if (check == true){
            if (registerFlag == 0){
                message.text = "本当によろしいですか"
                message.isHidden = false
                calculateUsage()
                print(registerFlag)
                registerFlag = registerFlag + 1
            }else{
                print("登録処理実施")
                print(registerFlag)
                
                //登録処理
                
            }
        }else{
            message.text = "検針値を入力してください"
            message.isHidden = false
        }
        
    }
    
    public func calculateUsage(){
        //強制的に値を出しているので、事前にnilではないことを確認する処理が必要。メソッド呼ぶ前の処理につ追加しないと多分落ちる★
        var inputValueInt: Int = Int(inputValue.text!)!
        var usageThisYearInt: Int = inputValueInt - Int(lastMonthValue.text!)!
        usageThisYear.text = String(usageThisYearInt)
        
    }
    
    func inputCheck() -> Bool {
        if Int(inputValue.text!) != nil{
            return true
        }else{
            return false
        }
    }
    
}
