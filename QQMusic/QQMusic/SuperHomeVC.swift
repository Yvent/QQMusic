//
//  SuperHomeVC.swift
//  QQMusic
//
//  Created by 周逸文 on 17/2/16.
//  Copyright © 2017年 Devil. All rights reserved.
//

import UIKit

class SuperHomeVC: UIViewController {

    lazy var tabbarv: UIView = {
            let tab = QQMusicTabbar()
        return tab
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        initChildVCOrSubViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func initChildVCOrSubViews() {
        let navHomevc = UINavigationController(rootViewController: HomeVC())
        
        addChildViewController(navHomevc)
        
        view.addSubview(navHomevc.view)
        view.addSubview(tabbarv)
        navHomevc.view.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        tabbarv.snp.makeConstraints { (make) in
            make.width.equalTo(ScreenWidth)
            make.height.equalTo(TabbarHeight)
            make.centerX.equalTo(view)
            make.bottom.equalTo(view)
        }
    }

}
