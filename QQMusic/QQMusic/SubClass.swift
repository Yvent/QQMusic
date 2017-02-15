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
    var centeritem: UILabel = UILabel()
    var rightitem: UIButton = UIButton()
    
    
    init(zyw_bc bc: UIColor = ZYW_BC,any: Any,title: String = "ZYW_BackView",lefttitle: String? = nil,righttitle: String? = nil) {
        super.init(frame: CGRect.zero)
        self.delegate = any as? ZYWBackViewDelegate
        addBackViewToVC()
        initBackview(zyw_bc: bc, title: title, lefttitle: lefttitle, righttitle: righttitle)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addBackViewToVC() {
        self.delegate.zywsetBackView(backView: self)
    }
    func initBackview(zyw_bc bc: UIColor = ZYW_BC,title: String = "ZYW_BackView",lefttitle: String? = nil,righttitle: String? = nil) {
        backgroundColor = bc
        centeritem.text = title
        centeritem.textAlignment = .center
        centeritem.textColor = UIColor.white
        addSubview(centeritem)
        centeritem.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(20)
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(AdaptationWidth(200))
            make.bottom.equalTo(self)
        }
        
        if lefttitle != nil {
            leftitem.setTitle(lefttitle, for: .normal)
            addSubview(leftitem)
            leftitem.snp.makeConstraints { (make) in
                make.left.equalTo(self).offset(10)
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
                make.right.equalTo(self).offset(-10)
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
}
