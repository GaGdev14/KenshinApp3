//
//  VCCustmer.swift
//  KenshinApp3
//
//  Created by 1490402 on 2018/11/10.
//  Copyright © 2018年 GaGdev14. All rights reserved.
//

import UIKit
import RealmSwift

class VCCustomer: UIViewController ,UISearchBarDelegate  {
    
    var gohList : [String] = []
    
    
    @IBOutlet weak var tableView: UITableView!
    //検索バー
    @IBOutlet weak var searchBar: UISearchBar!
    //検索結果配列
    var searchResult = [String]()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var sectionGohNo: [String] = []
    var Cstdata:[[String]] = [[]]
    
    //他の画面に渡す検針お客様情報
    //var selectObjects: Results<DataModel>!
    var row:[Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var objects: Results<DataModel>!
        
    
        
   
        
        //Realmのインスタンス取得
        let realm = try! Realm()
        
        //データベース内に保存してあるPersonモデルを全て取得。
        objects = realm.objects(DataModel.self)
        //初期値設定
        appDelegate.selectObjects = objects
        appDelegate.num = 0
        
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
        
        //デリゲート先を自分に設定する。
        searchBar.delegate = self
        
        //何も入力されていなくてもReturnキーを押せるようにする。
        searchBar.enablesReturnKeyAutomatically = false
        
        //テンキー設定
        //self.searchBar.keyboardType = UIKeyboardType.numberPad
        
        searchBar.showsCancelButton = true

        
        //検索結果配列にデータをコピーする。
        searchResult = sectionGohNo
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    //検索ボタン押下時の呼び出しメソッド
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        
        //検索結果配列を空にする。
        searchResult.removeAll()
        
        if(searchBar.text == "") {
            //検索文字列が空の場合はすべてを表示する。
            searchResult = sectionGohNo
        } else {
            //検索文字列を含むデータを検索結果配列に追加する。
            for data in sectionGohNo {
                if data.contains(searchBar.text!) {
                    searchResult.append(data)
                }
            }
        }
        print("search")
        //テーブルを再読み込みする。
        tableView.reloadData()
    }
    
    // キャンセルボタンが押された時に呼ばれる
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        self.view.endEditing(true)
        searchBar.text = ""
        self.tableView.reloadData()
    }
    
    // テキストフィールド入力開始前に呼ばれる
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.showsCancelButton = true
        return true
    }
    
}

// データ・ソース
extension VCCustomer: UITableViewDataSource {
    
    // セクションごとにデータ要素数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Cstdata[section].count
    }
    
    // セクション数
    func numberOfSections(in tableView: UITableView) -> Int {
        return searchResult.count
        //return sectionGohNo.count
    }
    
    // セクションヘッダ
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?  {
        return searchResult[section]
        //return sectionGohNo[section]
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
        //確認用
        print(indexPath)
        //Realmのインスタンス取得
        let realm = try! Realm()
        
        //選択されたセルの号番号でフィルター
        appDelegate.selectObjects! = realm.objects(DataModel.self).filter("goh == %@", sectionGohNo[indexPath.section])
        appDelegate.num! = indexPath.row
        
        
        //お客様照会画面へ遷移
         self.tabBarController!.selectedIndex = 1
        
        //セルの選択解除
        tableView.deselectRow(at: indexPath, animated: true)
       
    }

}

extension VCCustomer:  TabBarDelegate{    
    func didSelectTab(tabBarController: UITabBarController) {
        print("Cust")
    }
}



