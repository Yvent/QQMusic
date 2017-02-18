//
//  MineHeadImageCell.swift
//  QQMusic
//
//  Created by 周逸文 on 17/2/16.
//  Copyright © 2017年 Devil. All rights reserved.
//

import UIKit

class MineHeadImageCell: UITableViewCell ,UICollectionViewDelegate, UICollectionViewDataSource {

    var headimagebtn: UIButton!
    var mintuesbtn: UIButton!
    var becomevipbtn: UIButton!
    var namelabel: UILabel!
    var tovipbtn: UIButton!
    
    var contentV: UICollectionView!
    let headheight: CGFloat = 56
    
    var iconnames = ["mymusic_icon_allsongs_normal","mymusic_icon_download_normal","mymusic_icon_history_normal","mymusic_icon_favorite_normal","mymusic_icon_mv_normal","mymusic_icon_paidmusic_normal"]
    
    var titles = ["全部歌曲","下载歌曲","最近播放","我喜欢","下载MV","已购音乐"]
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        initUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func initUI() {
        headimagebtn = UIButton( nn: "",rd: headheight/2)
        mintuesbtn = UIButton(zyw_nt: "0分钟", ntc: UIColor.black, nn: "", ts: 14, rd: headheight/4, bc: UIColor.white, bdc: RGBSingle(217).cgColor, bdw: 1)
        becomevipbtn = UIButton(zyw_nt: "开通", ntc: UIColor.black, nn: "", ts: 14, rd: headheight/4, bc: UIColor.white, bdc: RGBSingle(217).cgColor, bdw: 1)
        namelabel = UILabel(zyw_lt: "— Devil —", ltc: UIColor.black, ts: 18, alg: .center)
        tovipbtn = UIButton( nn: "")
        
        addSubviews([headimagebtn,mintuesbtn,becomevipbtn,namelabel,tovipbtn])
        headimagebtn.snp.makeConstraints { (make) in
            make.width.height.equalTo(headheight)
            make.centerX.equalTo(self)
            make.top.equalTo(self).offset(16)
        }
        mintuesbtn.snp.makeConstraints { (make) in
            make.width.equalTo(71)
            make.height.equalTo(headheight/2)
            make.centerY.equalTo(headimagebtn)
            make.right.equalTo(headimagebtn.snp.left).offset(-40)
        }
        becomevipbtn.snp.makeConstraints { (make) in
            make.width.height.centerY.equalTo(mintuesbtn)
            make.left.equalTo(headimagebtn.snp.right).offset(40)
        }
        namelabel.snp.makeConstraints { (make) in
            make.width.equalTo(120)
            make.height.equalTo(25)
            make.centerX.equalTo(headimagebtn)
            make.top.equalTo(headimagebtn.snp.bottom).offset(5)
        }
        tovipbtn.snp.makeConstraints { (make) in
            make.width.height.equalTo(25)
            make.centerX.equalTo(headimagebtn)
            make.top.equalTo(namelabel.snp.bottom)
        }
        
        let layout = UICollectionViewFlowLayout(sd: .vertical,mls: 0, mis: 0, ise: CGSize(width: ScreenWidth/3, height: MinePlayerFuncCellHeight/2))
        
        contentV = UICollectionView(zyw_bc: UIColor.white, any: self,layout: layout)
        contentView.addSubview(contentV)
        
        
        
        contentV.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(contentView)
            make.height.equalTo(MinePlayerFuncCellHeight)
        }
        contentV.register(MinePlayerFuncSubCell.self, forCellWithReuseIdentifier: "MinePlayerFuncSubCell")
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MinePlayerFuncSubCell", for: indexPath) as! MinePlayerFuncSubCell
        cell.imagev.image =  UIImage(named: iconnames[indexPath.row])
        cell.title.text = titles[indexPath.row]
        cell.subtitle.text = "78"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}




class MinePlayerFuncSubCell: UICollectionViewCell {

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
        title = UILabel( ltc: UIColor.black, ts: 16, alg: .center)
        subtitle = UILabel( ltc: UIColor.black, ts: 12, alg: .center)
        contentView.addSubviews([imagev,title,subtitle])
    
        imagev.snp.makeConstraints { (make) in
            make.width.height.equalTo(45)
            make.centerX.equalTo(contentView)
            make.top.equalTo(contentView).offset(5)
        }
        title.snp.makeConstraints { (make) in
            make.centerX.equalTo(imagev)
            make.top.equalTo(imagev.snp.bottom).offset(5)
        }
        subtitle.snp.makeConstraints { (make) in
            make.centerX.equalTo(imagev)
            make.top.equalTo(title.snp.bottom)
        }
    
    }
}

let MineRadioCellHeight: CGFloat = 65

class MineRadioCell: UITableViewCell{
    
    
    var imagev: UIImageView!
    var title: UILabel!
    var subtitle: UILabel!
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        initUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initUI() {
        imagev = UIImageView(image: UIImage(named: "7B9F2B84-052E-4575-9EEE-80892FCECB24"))
        title = UILabel( ltc: UIColor.black, ts: 16, alg: .center)
        subtitle = UILabel( ltc: RGBSingle(112), ts: 12, alg: .center)
        contentView.addSubviews([imagev,title,subtitle])
        imagev.snp.makeConstraints { (make) in
            make.width.height.equalTo(MineRadioCellHeight)
            make.left.centerY.equalTo(contentView)
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
