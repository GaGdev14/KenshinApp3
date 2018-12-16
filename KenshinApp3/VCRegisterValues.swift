//
//  VCRegisterValues.swift
//  KenshinApp3
//
//  Created by MaiInagaki on 2018/11/12.
//  Copyright © 2018年 GaGdev14. All rights reserved.
//

import UIKit
import RealmSwift

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
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var inputValueInt: Int = 0
    var usageThisYearInt: Int = 0
    var lastMonthValueInt: Int = 0
    var usageOfLastYearInt: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //入力ボックスのデフォルト値（うっすら表示する文字）
        inputValue.placeholder = "入力してください"
        
        //数字のキーボードを表示する
        self.inputValue.keyboardType = UIKeyboardType.numberPad

        message.isHidden = true
        
        //ここで値代入。今は仮の値
        lastMonthValueInt = appDelegate.selectObjects![appDelegate.num!].lastMonthValue
        usageOfLastYearInt = appDelegate.selectObjects![appDelegate.num!].usedLastYear
        
        lastMonthValue.text = String(lastMonthValueInt)
        usageOfLastYear.text = String(usageOfLastYearInt)
        
        
    }
    
    @IBAction func registerValue(_ sender: Any) {
        print("ボタン押下")
        print(registerFlag)
        var check:Bool = false
        check = inputCheck()
        if (check == true){
            if (registerFlag == 0){
                message.text = "本当によろしいですか"
                message.isHidden = false
                calculateUsage()
                registerFlag = registerFlag + 1
            }else{
                print("登録処理実施")
                //登録処理
                
                let realm = try! Realm()
                //1xで検索
                let gmtSetNo = appDelegate.selectObjects![appDelegate.num!].gmtSetNo
                // 保存するObjectの取得
                let object = realm.object( ofType: DataModel.self,forPrimaryKey:gmtSetNo)!

                //DB更新処理
                try! realm.write() {
                    //今回検針値更新
                    object.thisMonthValue = inputValueInt
                    //今回使用量更新
                    object.usedThisMonth = usageThisYearInt
                }
                //モーダルを閉じ、次のお客さま確認画面へ進む処理
                //とりあえず閉じるだけ。
                self.dismiss(animated: true, completion: nil)
            }
        }else{
            message.text = "検針値を入力してください"
            message.isHidden = false
        }
        
    }
    
    public func calculateUsage(){
         inputValueInt = Int(inputValue.text!)!
         usageThisYearInt = inputValueInt - Int(lastMonthValue.text!)!
        usageThisYear.text = String(usageThisYearInt)
        
    }
    
    func inputCheck() -> Bool {
        if Int(inputValue.text!) != nil{
            return true
        }else{
            registerFlag = 0
            return false
        }
    }
    
}
