//
//  VCTabbarViewController.swift
//  KenshinApp3
//
//  Created by 1490402 on 2018/12/14.
//  Copyright © 2018 GaGdev14. All rights reserved.
//

import UIKit
import RealmSwift

class VCTabbarViewController: UITabBarController,UITabBarControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        self.tabBar.tintColor = UIColor.brown

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
   func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if viewController is TabBarDelegate {
            let vc = viewController as! TabBarDelegate
            vc.didSelectTab(tabBarController: self)
        }
    }
}
