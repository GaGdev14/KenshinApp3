//
//  VCDetail_ServiceContainer.swift
//  KenshinApp3
//
//  Created by MaiInagaki on 2018/11/11.
//  Copyright © 2018年 GaGdev14. All rights reserved.
//

import UIKit

class VCDetail_ServiceContainer: UITableViewController{
    
    //サービス情報項目
    var sectionName:[String] = ["検針留意情報","口座拒否","チラシ拒否","応対時フィールド","応対時社内対応","ガスメータ取付位置の特殊","検針専用情報","検針連絡先情報","検針事前連絡情報","連続０m3調査結果"]
    var serviceRepo:[String] = []
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
       
    }
    
    /*
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return 3
    }
 */
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = serviceRepo[indexPath.section]
        
        return cell
    }
    
    // セクションごとにデータ要素数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // セクション数
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionName.count
        //return sectionGohNo.count
    }
    
    // セクションヘッダ
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?  {
        return sectionName[section]
    }
    
    //タブを遷移した際に呼び出される
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //検索結果配列を空にする。
        serviceRepo.removeAll()
        //サービス情報内容を追加
        serviceRepo.append(appDelegate.selectObjects![appDelegate.num!].serviceInfo1)
        serviceRepo.append(appDelegate.selectObjects![appDelegate.num!].serviceInfo2)
        serviceRepo.append(appDelegate.selectObjects![appDelegate.num!].serviceInfo3)
        serviceRepo.append(appDelegate.selectObjects![appDelegate.num!].serviceInfo4)
        serviceRepo.append(appDelegate.selectObjects![appDelegate.num!].serviceInfo5)
        serviceRepo.append(appDelegate.selectObjects![appDelegate.num!].serviceInfo6)
        serviceRepo.append(appDelegate.selectObjects![appDelegate.num!].serviceInfo7)
        serviceRepo.append(appDelegate.selectObjects![appDelegate.num!].serviceInfo8)
        serviceRepo.append(appDelegate.selectObjects![appDelegate.num!].serviceInfo9)
        serviceRepo.append(appDelegate.selectObjects![appDelegate.num!].serviceInfo10)
        print("サービス情報表示確認")
        
    }
    
    
}
