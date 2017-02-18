//
//  HomeVC.swift
//  QQMusic
//
//  Created by 周逸文 on 17/2/16.
//  Copyright © 2017年 Devil. All rights reserved.
//

import UIKit

class HomeVC: UIViewController,ZYWBackViewDelegate {


    private var topV: UIView!
    private var ContentView: UIScrollView!
    lazy var mineV: UIView = {
        let VC = MineVC()
        self.addChildViewController(VC)
        return VC.view
    }()
    lazy var musicPavilionV: UIView = {
        let VC = MusicPavilionVC()
        self.addChildViewController(VC)
        return VC.view
    }()
    lazy var discoverV: UIView = {
        let VC = DiscoverVC()
        self.addChildViewController(VC)
        return VC.view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = UIColor.white
        
        initUI()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.white
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func initUI(){
        topV = ZYW_BackView(zyw_bc: NAVBC, any: self, title: "音乐库",centerlefttitle:"我的",centerrighttitle: "发现", lefttitle: "菜单", righttitle: "识曲")
        ContentView = UIScrollView(zyw_bc: UIColor.white, any: self, isP: true)
        view.addSubview(ContentView)
        ContentView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(view)
            make.top.equalTo(topV.snp.bottom)
            
        }
        
        ContentView.addSubviews([mineV,musicPavilionV,discoverV])
        mineV.snp.makeConstraints { (make) in
            make.left.equalTo(ContentView)
            make.top.equalTo(ContentView)
            make.height.equalTo(HomeSubviewHeight)
            make.width.equalTo(ScreenWidth)
        }
        musicPavilionV.snp.makeConstraints { (make) in
            make.left.equalTo(mineV.snp.right)
            make.top.equalTo(ContentView)
            make.height.equalTo(mineV)
            make.width.equalTo(mineV)
        }
        discoverV.snp.makeConstraints { (make) in
            make.left.equalTo(musicPavilionV.snp.right)
            make.top.equalTo(ContentView)
            make.height.equalTo(mineV)
            make.width.equalTo(mineV)
        }
        
    
    }
    ///菜单
    func zywdidleftitem() {
        
    }
    ///识曲
    func zywdidrightitem() {
        
    }
}
extension HomeVC : UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.x > ScreenWidth * 2 {
            
            scrollView.isScrollEnabled = false
        }else if scrollView.contentOffset.x < 0 {
            
            scrollView.isScrollEnabled = false
        }else{
            scrollView.isScrollEnabled = true
        }
        
        
//        if scrollView.contentOffset.x >= ScreenWidth {
//            
//            backgroundImgV.frame.origin.x = CGFloat(getX(Float(ScreenWidth * 2), minX: Float(ScreenWidth), maxBGX:  -Float(ScreenWidth), minBGX:  -Float(ScreenWidth/2), currentX: Float(scrollView.contentOffset.x)))
//            
//            
//        }else if scrollView.contentOffset.x < ScreenWidth {
//            backgroundImgV.frame.origin.x = CGFloat(getX(Float(ScreenWidth * 2), minX: Float(ScreenWidth), maxBGX:  -Float(ScreenWidth), minBGX:  -Float(ScreenWidth/2), currentX: Float(scrollView.contentOffset.x)))
//            
//        }
     
    }
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        
//        let page = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
//        PageContrl.currentPage = page
//    }
//    func pageChanged(_ CP: Int) {
//        //展现当前页面内容
//        ContentView.contentOffset.x = ScreenWidth * CGFloat(CP)
//    }
}
