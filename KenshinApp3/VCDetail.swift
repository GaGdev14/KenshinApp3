//
//  VCDetail.swift
//  KenshinApp3
//
//  Created by MaiInagaki on 2018/11/11.
//  Copyright © 2018年 GaGdev14. All rights reserved.
//

import UIKit

// ここに何人目のお客さまかという情報を入れる。現時点で初回は0としている
var count: Int = 0

class VCDetail: UIViewController{
 
    @IBOutlet weak var changeContauner: UISegmentedControl!
    @IBOutlet weak var containerView: UITableView!
    @IBOutlet weak var serviceContainer: UIView!
    @IBOutlet weak var dogContainer: UIView!
    @IBOutlet weak var otherContainer: UIView!
    var containers: Array<UIView> = []
    
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
    
    @objc final func handleSwipe(sender: UISwipeGestureRecognizer) {
        
        if sender.state == .ended {
            switch sender.direction {
            case .right:
                print("前のお客さま")
                count = count - 1
                print(count)
                // 画面遷移
                let storyboard = UIStoryboard(name: "Detail", bundle: nil)
                let nextView = storyboard.instantiateViewController(withIdentifier: "VCDatail-ID")
                self.present(nextView, animated: true, completion: nil)
                
            case .left:
                print("次のお客さま")
                count = count + 1
                print(count)
                // 画面遷移
                let storyboard = UIStoryboard(name: "Detail", bundle: nil)
                let nextView = storyboard.instantiateViewController(withIdentifier: "VCDatail-ID")
                self.present(nextView, animated: true, completion: nil)
            default:
                break
            }
        }
        
    }
    
    /*
    func didSelectTab(tabBarController: VCTabbarViewController) {
        print("first!")
    }
 */

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func changeContainerView(_ sender: UISegmentedControl) {
        let currentContainerView = containers[sender.selectedSegmentIndex]
        containerView.bringSubviewToFront(currentContainerView)
    }

}
