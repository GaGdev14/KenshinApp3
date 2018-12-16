//
//  VCDetail.swift
//  KenshinApp3
//
//  Created by MaiInagaki on 2018/11/11.
//  Copyright © 2018年 GaGdev14. All rights reserved.
//

import UIKit
import RealmSwift
// ここに何人目のお客さまかという情報を入れる。現時点で初回は0としている
//var count: Int = 0


class VCDetail: UIViewController{
 
    @IBOutlet weak var changeContauner: UISegmentedControl!
    @IBOutlet weak var containerView: UITableView!
    @IBOutlet weak var serviceContainer: UIView!
    @IBOutlet weak var dogContainer: UIView!
    @IBOutlet weak var otherContainer: UIView!
    var containers: Array<UIView> = []
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
    
    
    @IBOutlet weak var name: UILabel! //氏名
    @IBOutlet weak var gmtset: UILabel! //社番
    @IBOutlet weak var meterReadingMethod: UILabel! //検針方法
    @IBOutlet weak var paymentForm: UILabel! //払込書
    
    @IBOutlet weak var supplyState: UILabel! //開閉栓状態
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containers = [serviceContainer,dogContainer,otherContainer]
        containerView.bringSubviewToFront(serviceContainer)
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        rightSwipe.direction = .right
        view.addGestureRecognizer(rightSwipe)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        leftSwipe.direction = .left
        view.addGestureRecognizer(leftSwipe)
        
        //意味なし。これでもタブが消えゆく・・・

        tabBarController?.tabBar.isHidden = false
        
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
                
                //selectObjectの添え字がマイナスになならないようにち調整
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

