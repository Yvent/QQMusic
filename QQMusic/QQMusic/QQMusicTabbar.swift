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
        contentV = UICollectionView(yv_bc: RGBSingle(246), any: self, isP: true, layout: layout)
        contentV.register(MiniplayerCell.self, forCellWithReuseIdentifier: "MiniplayerCell")
        playorpausebtn = UIButton(  nn: "miniplayer_btn_play_normal",
                                    sn: "miniplayer_btn_pause_normal",bc:RGBSingle(246))
        playorpausebtn.addTarget(self, action: #selector(QQMusicTabbar.doPlayorpausebtn), for: .touchUpInside)
        songlistbtn = UIButton( nn: "miniplayer_btn_playlist_normal",bc:RGBSingle(246))
        songlistbtn.addTarget(self, action: #selector(QQMusicTabbar.doSonglistbtn), for: .touchUpInside)
        addSubviews([songlistbtn,playorpausebtn,contentV])
        songlistbtn.frame = CGRect(x: ScreenWidth - TabbarHeight, y: 0, width: TabbarHeight, height: TabbarHeight)
        playorpausebtn.frame = CGRect(x: ScreenWidth - TabbarHeight*2, y: 0, width: TabbarHeight, height: TabbarHeight)

        contentV.snp.makeConstraints { (make) in
            make.left.top.bottom.equalTo(self)
            make.width.equalTo(ScreenWidth - (TabbarHeight * 2))
        }
        playorpausebtn.yvDrawStaticCircle()
    }
    func doPlayorpausebtn() {
        if playorpausebtn.isSelected == true {
            playorpausebtn.isSelected = false
            YVMusicTool.sharedTools.pauseMusic()
        }else{
            playorpausebtn.isSelected = true
            
            let cell = contentV.cellForItem(at:  IndexPath(row: 0, section: 0)) as! MiniplayerCell
            startAnimation(cell.imagev)
            let path: String = Bundle.main.path(forResource: "汪晨蕊-友情岁月 (Live) (汪晨蕊胜出)", ofType: "mp3")!
            
            YVMusicTool.sharedTools.playMusic(urlString: path) { (progress) in
                //返回进度
                self.playorpausebtn.yvDrawDynamicCircle(progress: progress)
            }
        }
        
      
    }
    func doSonglistbtn() {
        
    }
    private func startAnimation(_ view: UIView) {
        
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        
        anim.toValue = 2 * M_PI
        anim.repeatCount = MAXFLOAT
        anim.duration = 30
        // 提示：对于需要循环播放的动画，可以设置此属性为 false
        // 视图离开屏幕后，不会被销毁！当 动画所在视图被销毁后，动画会连带销毁
        // 不需要考虑释放问题
        anim.isRemovedOnCompletion = false
        
        view.layer.add(anim, forKey: nil)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MiniplayerCell", for: indexPath) as! MiniplayerCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! MiniplayerCell
        
        
        MiniPlayerView().show(cell.imagev!,toframe: CGRect(x: 30, y: 110, width: ScreenWidth-60, height: ScreenWidth-60))

        
    }

}
