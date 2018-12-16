//
//  TabBarDelegate.swift
//  KenshinApp3
//
//  Created by 1490402 on 2018/12/14.
//  Copyright © 2018 GaGdev14. All rights reserved.
//

//import Foundation
import UIKit
import RealmSwift

//@objc
 protocol TabBarDelegate {
    func didSelectTab(tabBarController: UITabBarController)
    //デリゲートで受け渡しするお客様情報のオブジェクト
    //var custInfo: Results<DataModel>{set get}
}
