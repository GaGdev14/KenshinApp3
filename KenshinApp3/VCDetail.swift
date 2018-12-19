//
//  VCDetail.swift
//  KenshinApp3
//
//  Created by MaiInagaki on 2018/11/11.
//  Copyright © 2018年 GaGdev14. All rights reserved.
//

import UIKit
import RealmSwift



class VCDetail: UIViewController{
 
    @IBOutlet weak var changeContauner: UISegmentedControl!
    @IBOutlet weak var containerView: UITableView!
    @IBOutlet weak var serviceContainer: UIView!
    @IBOutlet weak var dogContainer: UIView!
    @IBOutlet weak var otherContainer: UIView!
    var containers: Array<UIView> = []
    @IBOutlet weak var selectMenu: UISegmentedControl!
    
    //他の画面に渡す検針お客様情報
    //var selectObjects: Results<DataModel>!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    //お客様名
    @IBOutlet weak var custName: UILabel!
    //メーター社番
    @IBOutlet weak var meterNo: UILabel!
    //検針方法
    @IBOutlet weak var knsnHhCd: UILabel!
    //開閉栓状態
    @IBOutlet weak var khsnJtCd: UILabel!
    //支払い方法
    @IBOutlet weak var shrHhCd: UILabel!
    
    @IBOutlet weak var paymentForm: UILabel! //払込書
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containers = [serviceContainer,dogContainer,otherContainer]
        containerView.bringSubviewToFront(serviceContainer)
        
        //臨時直書き
        
        knsnHhCd.text = "はこ"
        paymentForm.text = "なし"
        khsnJtCd.text = "開栓"
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        rightSwipe.direction = .right
        view.addGestureRecognizer(rightSwipe)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        leftSwipe.direction = .left
        view.addGestureRecognizer(leftSwipe)
        
        //意味なし。これでもタブが消えゆく・・・

        tabBarController?.tabBar.isHidden = false
        
        //selectMenu.tintColor = UIColor.brown
        selectMenu.tintColor = UIColor(hex: "5D4037", alpha: 1.0)
        
    }
    
    //タブを遷移した際に呼び出される
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //お客様名格納
        custName.text = String(appDelegate.selectObjects![appDelegate.num!].name)
        //社番格納
        meterNo.text = String(appDelegate.selectObjects![appDelegate.num!].syaban)
        //debug用
        print("detail表示確認")

        
    }
    
    @objc final func handleSwipe(sender: UISwipeGestureRecognizer) {
        
        if sender.state == .ended {
            switch sender.direction {
            case .right:
                print("前のお客さま")
                
                //selectObjectの添え字がマイナスになならないように調整
                if appDelegate.num! == 0{
                    appDelegate.num! = appDelegate.selectObjects!.count-1
                }
                else{
                    appDelegate.num! -= 1
                }
                print("\(appDelegate.num!)")
                
                //count = count - 1
                //print(count)
                // 画面遷移

                //let storyboard = UIStoryboard(name: "Detail", bundle: nil)
                //let nextView = storyboard.instantiateViewController(withIdentifier: "VCDatail-ID")
                //self.present(nextView, animated: true, completion: nil)

                
            case .left:
                print("次のお客さま")
                
                //selectObjectの配列の添え字が最大個数を超えないように調整
                if appDelegate.num! == appDelegate.selectObjects!.count-1{
                    appDelegate.num! = 0
                }
                else{
                    appDelegate.num! += 1
                }

                //count = count + 1
                //print(count)
                // 画面遷移
              
                //let storyboard = UIStoryboard(name: "Detail", bundle: nil)
                //let nextView = storyboard.instantiateViewController(withIdentifier: "VCDatail-ID")
                //self.present(nextView, animated: true, completion: nil)
            default:
                break
            }
            
            //結果を更新
            
            //お客様名格納
            custName.text = String(appDelegate.selectObjects![appDelegate.num!].name)
            //社番格納
            meterNo.text = String(appDelegate.selectObjects![appDelegate.num!].syaban)

        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func changeContainerView(_ sender: UISegmentedControl) {
        let currentContainerView = containers[sender.selectedSegmentIndex]
        containerView.bringSubviewToFront(currentContainerView)
    }

}
extension VCDetail:  TabBarDelegate{
    func didSelectTab(tabBarController: UITabBarController) {
        print("Detail")
    }

}

