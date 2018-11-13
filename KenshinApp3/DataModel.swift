//
//  DataModel.swift
//  KenshinApp
//
//  Created by 1490402 on 2018/09/25.
//  Copyright © 2018年 GaGdev14. All rights reserved.
//

import Foundation
import RealmSwift

class DataModel: Object {
    
    //1x
    @objc dynamic var gmtSetNo: Int = 0
    //お客様名
    @objc dynamic var name: String = ""
    //号番号
    @objc dynamic var goh: String = ""
    //社番
    @objc dynamic var syaban: Int = 0
    //号詳細
    @objc dynamic var gohDetail: String = ""
    //住所
    @objc dynamic var jusho: String = ""
    //今回指示数
    @objc dynamic var thisMonthValue: Int = 0
    //前回指示数
    @objc dynamic var lastMonthValue: Int = 0
    //今回使用量
    @objc dynamic var usedThisMonth: Int = 0
    //前月使用量
    @objc dynamic var usedLastMonth: Int = 0
    //前年使用量
    @objc dynamic var usedLastYear: Int = 0

    //primaryKeyを定義
    override static func primaryKey() -> String? {
        return "gmtSetNo"
   }

}
