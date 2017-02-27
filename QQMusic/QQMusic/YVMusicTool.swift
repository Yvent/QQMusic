//
//  YVMusicTool.swift
//  QQMusic
//
//  Created by 周逸文 on 17/2/24.
//  Copyright © 2017年 Devil. All rights reserved.
//


import UIKit
import AVFoundation


class YVMusicTool: NSObject {
    
    
    var player: AVPlayer!
    var playeritem: AVPlayerItem!
    var currenturl: String!
    
    static let sharedTools = YVMusicTool()
    private override init() {}
    
    func playMusic(urlString: String,progress:@escaping (_ progress: Float)->()) {
        
        playeritem = AVPlayerItem(url:  URL(fileURLWithPath: urlString))
        
        if currenturl != urlString{
            if (player?.currentItem != nil) {
                player.replaceCurrentItem(with: playeritem)
            }else{
                player = AVPlayer(playerItem: playeritem)
                player?.volume = 1.0
            }
        }
       
        currenturl = urlString
        player?.play()
        addProgressObserver(progress: progress)
        NotificationCenter.default.addObserver(self, selector: #selector(YVMusicTool.musicPlayFinished(_:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player?.currentItem)
        
    }
    func pauseMusic() {
        player?.pause()
    }
    
    func musicPlayFinished(_ noti: NSNotification) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "playFinished"), object: self, userInfo: nil)
    
    }
    func addProgressObserver(progress: @escaping (Float) -> ()) {
        self.player.addPeriodicTimeObserver(forInterval:  CMTimeMake(1, 1), queue: DispatchQueue.main) { (time) in
            
            let current: Float = Float(CMTimeGetSeconds(time))
           let total: Float = Float(CMTimeGetSeconds((self.player.currentItem?.duration)!))
            progress(current/total)
        }
    }
    
}
