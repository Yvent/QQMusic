//
//  MiniPlayerScrollV.swift
//  QQMusic
//
//  Created by 周逸文 on 17/2/28.
//  Copyright © 2017年 Devil. All rights reserved.
//

import UIKit

class MiniPlayerScrollV: UIScrollView,UITableViewDelegate,UITableViewDataSource {

    var songdetilarrays = ["歌手：XXXX","专辑：XXXXX","单曲详情","相似单曲电台","XXXXX的相关新闻","包含此歌曲的热门歌单"]
    var lyricsarrays = ["m aklsam",";smcldkmvlkv","mckmvlmvklm","vsnvsdnvjfnvjrnvjrnvr","nkvjwnvkjwevwe","vwenvwkjenvw","m aklsam",";smcldkmvlkv","mckmvlmvklm","vsnvsdnvjfnvjrnvjrnvr","nkvjwnvkjwevwe","vwenvwkjenvw","m aklsam",";smcldkmvlkv","mckmvlmvklm","vsnvsdnvjfnvjrnvjrnvr","nkvjwnvkjwevwe","vwenvwkjenvw"]
    
    var songdetilV: UITableView!
    var centerClearV: UIView!
    var lyricsV: UITableView!
    
     init(yv_bc bc: UIColor =  RGB(33, G: 176, B: 89),
                  any: Any,
                  isP: Bool = false,cs: CGSize = CGSize(width: ScreenWidth * 3,height: HomeSubviewHeight)) {
        
      super.init(frame: CGRect.zero)
        self.backgroundColor = bc
        self.delegate = any as? UIScrollViewDelegate
        self.isPagingEnabled = isP
        self.scrollsToTop = false
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.contentSize = cs
    
        initUI()
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     private func initUI()  {
        songdetilV = UITableView(yv_bc: UIColor.clear, any: self, rh: 40, tabstyle: .plain, style: .none)
//        songdetilV.backgroundColor = UIColor.redr
        centerClearV = UIView()
//        centerClearV.backgroundColor = UIColor.green
        lyricsV = UITableView(yv_bc: UIColor.clear, any: self, rh: 40, tabstyle: .plain, style: .none)
//        lyricsV.backgroundColor = UIColor.blue
        
        self.addSubviews([songdetilV,centerClearV,lyricsV])
        
        songdetilV.snp.makeConstraints { (make) in
            make.width.equalTo(ScreenWidth)
            make.height.equalTo(ScreenWidth-60)
            make.left.top.equalTo(self)
            
        }
        centerClearV.snp.makeConstraints { (make) in
            make.height.width.equalTo(songdetilV)
            make.left.equalTo(songdetilV.snp.right)
            make.top.equalTo(self)
            
        }
        lyricsV.snp.makeConstraints { (make) in
            make.height.width.equalTo(songdetilV)
            make.top.equalTo(self)
            make.left.equalTo(centerClearV.snp.right)
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == songdetilV {
            return songdetilarrays.count
        }else{
          return lyricsarrays.count
        }
        
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == songdetilV {
            let cell = UITableViewCell()
            cell.backgroundColor = UIColor.clear
            cell.textLabel?.text = songdetilarrays[indexPath.row]
            cell.textLabel?.textColor = UIColor.white
            return cell
        }else{
            let cell = UITableViewCell()
            cell.backgroundColor = UIColor.clear
            cell.textLabel?.text = lyricsarrays[indexPath.row]
            cell.textLabel?.textColor = UIColor.white
            cell.textLabel?.textAlignment = .center
            return cell
        }
        
     
    }
}
