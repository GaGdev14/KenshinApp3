//
//  DataManager.swift
//  KenshinApp
//
//  Created by 1490402 on 2018/09/26.
//  Copyright © 2018年 GaGdev14. All rights reserved.
//

import Foundation
import RealmSwift


class DataManager: Object {
    
    //ファイルを読み込みRealmに格納
    func csvLoad(filename:String)->[String]{
        //csvファイルを格納するための配列を作成
        var csvArray:[String] = []
        //csvファイルの読み込み
        let csvBundle = Bundle.main.path(forResource: filename, ofType: "csv")
        do {
            //csvBundleのパスを読み込み、UTF8に文字コード変換して、NSStringに格納
            let tsvData = try String(contentsOfFile: csvBundle!,
                                 encoding: String.Encoding.utf8)

            //改行コードが\n一つになるようにします
            var lineChange = tsvData.replacingOccurrences(of: "\r", with: "\n")
            lineChange = lineChange.replacingOccurrences(of: "\n\n", with: "\n")
            //"\n"の改行コードで区切って、配列csvArrayに格納する
            csvArray = lineChange.components(separatedBy: "\n")
        }
        catch {
            print("エラー")
        }
        return csvArray
        }

    //読みこんだcsvデータをRealmに保存
    func saveCsvValue(csvStr:String) {
    
        let data = DataModel()
        // CSVなのでカンマでセパレート
        let splitStr = csvStr.components(separatedBy: ",")
        data.gmtSetNo = Int(splitStr[0])!
        data.name = splitStr[1]
        data.goh = splitStr[2]
        data.syaban = Int(splitStr[3])!
        data.gohDetail = splitStr[4]
        data.jusho = splitStr[5]
        data.thisMonthValue = Int(splitStr[6])!
        data.lastMonthValue = Int(splitStr[7])!
        data.usedThisMonth = Int(splitStr[8])!
        data.usedLastMonth = Int(splitStr[9])!
        data.usedLastYear = Int(splitStr[10])!
        
        // 保存
        let realm = try! Realm()
        do {
        try realm.write {
            realm.add(data)
            }
        } catch {
            print("エラー")
    
        }
    }
    

}
