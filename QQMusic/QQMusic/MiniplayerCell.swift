//
//  TabbarCell.swift
//  QQMusic
//
//  Created by 周逸文 on 17/2/17.
//  Copyright © 2017年 Devil. All rights reserved.
//

import UIKit

class MiniplayerCell: UICollectionViewCell {
    
    var imagev: UIImageView!
    var title: UILabel!
    var subtitle: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func initUI() {
        imagev =   UIImageView(zyw_named: "7B9F2B84-052E-4575-9EEE-80892FCECB24", rd: TabbarHeight/2)
        title = UILabel(zyw_lt: "凉凉", ltc: UIColor.black, ts: 16, alg: .center)
        subtitle = UILabel(zyw_lt: "张碧晨/杨宗纬", ltc: UIColor.black, ts: 12, alg: .center)
        contentView.addSubviews([imagev,title,subtitle])
        
        imagev.snp.makeConstraints { (make) in
            make.left.equalTo(contentView).offset(5)
            make.centerY.equalTo(contentView)
            make.width.height.equalTo(TabbarHeight)
            
        }
        title.snp.makeConstraints { (make) in
            make.left.equalTo(imagev.snp.right).offset(10)
            make.bottom.equalTo(imagev.snp.centerY)
        }
        subtitle.snp.makeConstraints { (make) in
            make.left.equalTo(title)
            make.top.equalTo(imagev.snp.centerY)
        }
        
    }
}

