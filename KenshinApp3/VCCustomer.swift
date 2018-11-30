//
//  VCCustmer.swift
//  KenshinApp3
//
//  Created by 1490402 on 2018/11/10.
//  Copyright © 2018年 GaGdev14. All rights reserved.
//

import UIKit
import RealmSwift

class VCCustomer: UIViewController {
    
    var gohList : [String] = []
    

    //@IBOutlet weak var CstTable: UITableView!
    //var items1: NSMutableArray = ["ねずみ", "うし", "とら", "うさぎ", "りゅう"]

    /*
    let Cstdata = [
        ["検針　花子１", "検針　花子2", "検針　花子3"],
        ["シナモロール", "モカ"]
    ]
 */
    
    //let sectionGohNo = ["1000-0001","1000-0002"]
    var sectionGohNo: [String] = []
    var Cstdata:[[String]] = [[]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var objects: Results<DataModel>!
        
        //Realmのインスタンス取得
        let realm = try! Realm()
        
        //データベース内に保存してあるPersonモデルを全て取得。
        objects = realm.objects(DataModel.self)
        
        //gohをlist配列に格納
        for i in 0..<objects.count {
            let object = objects[i]
            gohList.append(object.goh)
        }
        
        //重複無しの号番号リスト
        let orderedSet:NSOrderedSet = NSOrderedSet(array: gohList)
        sectionGohNo = orderedSet.array as! [String]
        
        //セクション番号ごとに要素を追加する
        for i in 0..<sectionGohNo.count{
            Cstdata.append([])
            let objs = realm.objects(DataModel.self).filter("goh == %@", sectionGohNo[i])
            for j in 0..<objs.count{
                Cstdata[i].append(objs[j].name)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // セルの数を返す。
    /*
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items1.count
    }
    
    // セルを返す。
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルにテキストを出力する。
        let cell = tableView.dequeueReusableCell(withIdentifier:  "cell", for:indexPath as IndexPath)
        cell.textLabel?.text = items1[indexPath.row] as? String
        
        return cell
    }
 */
    
}

// データ・ソース
extension VCCustomer: UITableViewDataSource {
    
    // セクションごとにデータ要素数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Cstdata[section].count
    }
    
    // セクション数
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionGohNo.count
    }
    
    // セクションヘッダ
    
    //色変更
    /*
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView:UIView = UIView()
        let headerLabel = UILabel()
        
        headerView.backgroundColor = UIColor(hex: "795548", alpha: 0.5)
        headerLabel.textColor = UIColor(hex: "FFFFFF", alpha: 1.0)
        //headerLabel.text = sectionGohNo[section]
        
        headerView.addSubview(headerLabel)
        
        return headerView
    }
 */

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?  {
        return sectionGohNo[section]
    }
    
    // セルの高さ
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    // セル生成
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = Cstdata[indexPath.section][indexPath.row]
        cell.accessoryType = .disclosureIndicator
        //cell.accessoryView = UISwitch() // スィッチ
        
        return cell
    }
}

// セルタップ時の動作定義など
extension VCCustomer: UITableViewDelegate {
    
    // セクションヘッダの高さ
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    // セルタップ時の挙動
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
}
 

