//
//  VCDetail.swift
//  KenshinApp3
//
//  Created by MaiInagaki on 2018/11/11.
//  Copyright © 2018年 GaGdev14. All rights reserved.
//

import UIKit

class VCDetail: UIViewController {
 
    @IBOutlet weak var changeContauner: UISegmentedControl!
    @IBOutlet weak var containerView: UITableView!
    @IBOutlet weak var serviceContainer: UIView!
    @IBOutlet weak var dogContainer: UIView!
    @IBOutlet weak var otherContainer: UIView!
    var containers: Array<UIView> = []
    
    // 実験。ここに何人目のお客さまかという情報を入れる予定
    var count :Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containers = [serviceContainer,dogContainer,otherContainer]
        containerView.bringSubviewToFront(serviceContainer)
        
        // 何人目のお客さまか表示
        print(count)
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        rightSwipe.direction = .right
        view.addGestureRecognizer(rightSwipe)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        leftSwipe.direction = .left
        view.addGestureRecognizer(leftSwipe)
    }
    
    @objc final func handleSwipe(sender: UISwipeGestureRecognizer) {
        
        if sender.state == .ended {
            switch sender.direction {
            case .right:
                print("前のお客さま")
            case .left:
                print("次のお客さま")
            default:
                break
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func changeContainerView(_ sender: UISegmentedControl) {
        let currentContainerView = containers[sender.selectedSegmentIndex]
        containerView.bringSubviewToFront(currentContainerView)
    }
}
