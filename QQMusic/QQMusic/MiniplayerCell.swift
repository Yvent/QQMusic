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
        imagev = UIImageView()
        UIImage(named: "7B9F2B84-052E-4575-9EEE-80892FCECB24")?.yv_asyncDrawImage(size: CGSize(width: ScreenWidth, height: ScreenWidth), isCorner: true, backColor: nil,finished: { (image) in
            self.imagev.image = image
        })
        
        title = UILabel(yv_lt: "凉凉", ltc: UIColor.black, ts: 16, alg: .left)
        subtitle = UILabel(yv_lt: "张碧晨/杨宗纬", ltc: UIColor.black, ts: 12, alg: .left)
        contentView.addSubviews([imagev,title,subtitle])
        

        imagev.frame = CGRect(x: 5, y: 0, width: TabbarHeight, height: TabbarHeight)
        title.frame = CGRect(x: 70, y: 5, width: self.frame.size.width - TabbarHeight - 10, height: TabbarHeight/3)
        subtitle.frame = CGRect(x: 70, y: TabbarHeight * 2/3 , width: self.frame.size.width - TabbarHeight - 10, height: TabbarHeight/3)

        
    }
    

}




