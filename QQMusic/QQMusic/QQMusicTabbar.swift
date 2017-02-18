//
//  QQMusicTabbar.swift
//  QQMusic
//
//  Created by 周逸文 on 17/2/16.
//  Copyright © 2017年 Devil. All rights reserved.
//

import UIKit
let TabbarHeight: CGFloat = 55

class QQMusicTabbar: UIView, UICollectionViewDelegate ,UICollectionViewDataSource{
    var contentV: UICollectionView!
    var playorpausebtn: UIButton!
    var songlistbtn: UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = RGBSingle(246)
        initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func initUI() {
        let layout = UICollectionViewFlowLayout(sd: .horizontal,mls: 0, mis: 0, ise: CGSize(width: ScreenWidth - (TabbarHeight * 2), height: TabbarHeight))
        contentV = UICollectionView(zyw_bc: RGBSingle(246), any: self, isP: true, layout: layout)
        contentV.register(MiniplayerCell.self, forCellWithReuseIdentifier: "MiniplayerCell")
        playorpausebtn = UIButton(  nn: "miniplayer_btn_play_normal",bc:RGBSingle(246))
        songlistbtn = UIButton( nn: "miniplayer_btn_playlist_normal",bc:RGBSingle(246))
        
        addSubviews([songlistbtn,playorpausebtn,contentV])
        songlistbtn.snp.makeConstraints { (make) in
            make.right.top.bottom.equalTo(self)
            make.width.equalTo(songlistbtn.snp.height)
            
        }
        playorpausebtn.snp.makeConstraints { (make) in
            make.top.equalTo(songlistbtn)
            make.height.width.equalTo(TabbarHeight)
            make.right.equalTo(songlistbtn.snp.left)
        }
        contentV.snp.makeConstraints { (make) in
            make.left.top.bottom.equalTo(self)
            make.width.equalTo(ScreenWidth - (TabbarHeight * 2))
        }
        
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MiniplayerCell", for: indexPath) as! MiniplayerCell
//        cell.imagev.image =  UIImage(named: iconnames[indexPath.row])
//        cell.title.text = titles[indexPath.row]
//        cell.subtitle.text = "78"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }

}
