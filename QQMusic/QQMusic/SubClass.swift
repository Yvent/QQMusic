//
//  ProtocolsAndSubClassAndExtension.swift
//  Pigs have spread
//
//  Created by 周逸文 on 17/2/15.
//  Copyright © 2017年 Devil. All rights reserved.
//

import Foundation
import UIKit

class ZYW_BackView: UIView{
    
    weak var delegate:ZYWBackViewDelegate!
    
    var leftitem: UIButton = UIButton()
    var centerleftitem: UIButton = UIButton()
    var centeritem: UIButton = UIButton()
    var centerrightitem: UIButton = UIButton()
    var rightitem: UIButton = UIButton()
    
    
    init(zyw_bc bc: UIColor = ZYW_BC,any: Any,title: String = "ZYW_BackView",centerlefttitle: String? = nil,centerrighttitle: String? = nil,lefttitle: String? = nil,righttitle: String? = nil) {
        super.init(frame: CGRect.zero)
        self.delegate = any as? ZYWBackViewDelegate
        addBackViewToVC()
        initBackview(zyw_bc: bc, title: title,centerlefttitle: centerlefttitle,centerrighttitle: centerrighttitle, lefttitle: lefttitle, righttitle: righttitle)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addBackViewToVC() {
        self.delegate.zywsetBackView(backView: self)
    }
    func initBackview(zyw_bc bc: UIColor = ZYW_BC,title: String = "ZYW_BackView",centerlefttitle: String? = nil,centerrighttitle: String? = nil,lefttitle: String? = nil,righttitle: String? = nil) {
        backgroundColor = bc
        centeritem.setTitle(title, for: .normal)
        addSubview(centeritem)
        centeritem.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(20)
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(AdaptationWidth(70))
            make.bottom.equalTo(self)
        }
        
        
        
        if centerlefttitle != nil {
            centerleftitem.setTitle(centerlefttitle, for: .normal)
            addSubview(centerleftitem)
            centerleftitem.snp.makeConstraints { (make) in
                make.width.height.centerY.equalTo(centeritem)
                make.right.equalTo(centeritem.snp.left)
            }
            centerleftitem.addTarget(self, action: #selector(ZYW_BackView.didcenterleftitem), for: .touchUpInside)
        }
        
        if centerrighttitle != nil {
            centerrightitem.setTitle(centerrighttitle, for: .normal)
            addSubview(centerrightitem)
            centerrightitem.snp.makeConstraints { (make) in
                make.width.height.centerY.equalTo(centeritem)
                make.left.equalTo(centeritem.snp.right)
            }
            centerrightitem.addTarget(self, action: #selector(ZYW_BackView.didlcenterrightitem), for: .touchUpInside)
        }
        
        
        
        if lefttitle != nil {
            leftitem.setTitle(lefttitle, for: .normal)
            addSubview(leftitem)
            leftitem.snp.makeConstraints { (make) in
                make.left.equalTo(self)
                make.top.equalTo(self).offset(20)
                make.width.equalTo(44)
                make.height.equalTo(44)
            }
            leftitem.addTarget(self, action: #selector(ZYW_BackView.didleftitem), for: .touchUpInside)
        }
      
        
        if righttitle != nil {
            rightitem.setTitle(righttitle, for: .normal)
            addSubview(rightitem)
            rightitem.snp.makeConstraints { (make) in
                make.right.equalTo(self)
                make.top.equalTo(self).offset(20)
                make.width.equalTo(44)
                make.height.equalTo(44)
            }
            rightitem.addTarget(self, action: #selector(ZYW_BackView.didrightitem), for: .touchUpInside)
        }
    }
    func didleftitem() {
        self.delegate?.zywdidleftitem()
    }
    func didrightitem() {
        self.delegate?.zywdidrightitem()
    }
    func didcenterleftitem() {
        
    }
    func didlcenterrightitem() {
        
    }
}
