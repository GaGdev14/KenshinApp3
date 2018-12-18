//
//  AppDelegate.swift
//  KenshinApp3
//
//  Created by 1490402 on 2018/11/06.
//  Copyright © 2018年 GaGdev14. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    //index
    var num:Int?
    //受け渡すオブジェクト
    var selectObjects:Results<DataModel>?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        do {
            let defaultURL = Realm.Configuration.defaultConfiguration.fileURL!
            // Realmファイルを削除
            try FileManager.default.removeItem( at: defaultURL) }
        catch {
            //削除できない場合の対応
        }
        
        //保存先の出力
        print(Realm.Configuration.defaultConfiguration.fileURL as Any)
        
        let dataM = DataManager()
        let csvArray = dataM.csvLoad(filename: "Sample")
        for csvStr in csvArray {
            dataM.saveCsvValue(csvStr: csvStr)
        }
        
        // ナビゲーションバーの色変更
        UINavigationBar.appearance().barTintColor = UIColor(hex: "5D4037", alpha: 1.0)
        
        // ナビゲーションタイトルの色変更
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(hex: "FFFFFF", alpha: 1.0)]

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

