//
//  VCDetail_DogContainer.swift
//  KenshinApp3
//
//  Created by MaiInagaki on 2018/11/11.
//  Copyright © 2018年 GaGdev14. All rights reserved.
//

import UIKit

class VCDetail_DogContainer: UITableViewController{
    
    //サービス情報項目
    var sectionName:[String] = ["屋外","室内",]
    var dogRepo:[String] = []
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = dogRepo[indexPath.section]
        return cell
    }
    
    // セクション数
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
       }
    
    // セクションヘッダ
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?  {
        return sectionName[section]
    }
    
    //タブを遷移した際に呼び出される
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //検索結果配列を空にする。
        dogRepo.removeAll()
        //サービス情報内容を追加
        dogRepo.append(appDelegate.selectObjects![appDelegate.num!].dogInfo1)
        dogRepo.append(appDelegate.selectObjects![appDelegate.num!].dogInfo2)
        print("犬情報表示確認")
        
    }
}
