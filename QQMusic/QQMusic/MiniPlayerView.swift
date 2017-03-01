//
//  MiniPlayerView.swift
//  QQMusic
//
//  Created by 周逸文 on 17/2/22.
//  Copyright © 2017年 Devil. All rights reserved.
//

import UIKit

class MiniPlayerView: UIView {
    
    private var backimageV: UIImageView!
    private var blurView: UIVisualEffectView!
    
    private var closeBtn: UIButton!
    private var containV: MiniPlayerScrollV!
    
    private var currentView: UIView!
    private var superFromView: UIView!
    private var frameForSuperView: CGRect!
    private var frameForWindow: CGRect!
    
    override init(frame: CGRect ) {
        super.init(frame: frame)
        initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private   func initUI() {
        backimageV = UIImageView(yv_named: "7B9F2B84-052E-4575-9EEE-80892FCECB24")
        blurView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        closeBtn = UIButton(nn: "miniplayer_btn_playlist_close_b")
        closeBtn.addTarget(self, action: #selector(MiniPlayerView.doCloseBtn), for: .touchUpInside)
        
        
        containV =  MiniPlayerScrollV(yv_bc: UIColor.clear, any: self, isP: true, cs: CGSize(width: ScreenWidth * 3, height: ScreenWidth-60))
        self.addSubviews([backimageV,blurView,closeBtn])
        backimageV.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        blurView.snp.makeConstraints { (make) in
            make.edges.equalTo(backimageV)
        }
        closeBtn.snp.makeConstraints { (make) in
            make.width.height.equalTo(50)
            make.left.top.equalTo(20)
        }
      
    }
    func doCloseBtn() {
        dismiss(currentView, toframe: frameForWindow)
    }
    func show( _ view: UIView, toframe: CGRect)  {
        superFromView = view.superview
        currentView = view
        
        frameForSuperView = view.frame
        let window: UIWindow! = (UIApplication.shared.delegate?.window)!
        view.frame =  window.convert(view.frame, from: view.superview)
        frameForWindow = view.frame
        self.backgroundColor = UIColor.blue
        self.frame = window.bounds
        self.alpha = 0
        containV.alpha = 0
        containV.frame = CGRect(x: 0, y: 110, width: ScreenWidth, height: ScreenWidth-60)

        window.addSubview(self)
        window.addSubview(view)
        window.addSubview(containV)
        pageChanged(1)
        UIView.animate(withDuration: 0.3, animations: {
            self.containV.alpha = 1
            self.alpha = 1
            view.transform = CGAffineTransform.identity
            view.frame = toframe
            
        }) { (true) in
            
        }
    }
    private  func dismiss(_ view: UIView, toframe: CGRect)  {
        
        UIView.animate(withDuration: 0.3, animations: {
            self.containV.alpha = 0
            self.alpha = 0
            
            view.transform = CGAffineTransform.identity
            view.frame = toframe
        }) { (true) in
            self.containV.removeFromSuperview()
            view.frame = self.frameForSuperView
            self.superFromView.addSubview(view)
            self.removeFromSuperview()
            
        }
    }
    private func pageChanged(_ CP: Int) {
        //展现当前页面内容
        containV.contentOffset.x = ScreenWidth * CGFloat(CP)
    }
}
