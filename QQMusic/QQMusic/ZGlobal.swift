//
//  ZGlobal.swift
//  wave
//
//  Created by 周逸文 on 16/9/7.
//  Copyright © 2016年 com.paohaile.zyw. All rights reserved.
//全局配置文件

import Foundation
import UIKit

let NAVBC: UIColor = RGB(58, G: 193, B: 126)

let CURRENTVERSION = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String

//MARK: UI
let ScreenWidth = UIScreen.main.bounds.width
let ScreenHeight = UIScreen.main.bounds.height

func AdaptationHeight(_ height: CGFloat) -> CGFloat {
    
    return CGFloat(ScreenHeight/667) * height
}
func AdaptationWidth(_ width: CGFloat) -> CGFloat {
    return CGFloat(ScreenWidth/375) * width
}

func AdaptationFontSize(_ size: CGFloat) -> CGFloat {
    return CGFloat(ScreenHeight/667) * size
}


func getStr(str: String? = nil) -> String {
    if str != nil {
        return str!
    }else{
        return "小组"
    }
}

func RGBSingle(_ s: CGFloat) -> UIColor {
    return RGB(s, G: s, B: s)
}
func RGB(_ R: CGFloat, G: CGFloat, B: CGFloat) -> UIColor {
    return UIColor(red: R/255.0, green: G/255.0, blue: B/255.0, alpha: 1.0)
}
func RGBA(_ R: CGFloat, G: CGFloat, B: CGFloat, A: CGFloat) -> UIColor {
    return UIColor(red: R/255.0, green: G/255.0, blue: B/255.0, alpha: A)
}
//func GetRandomColor() -> UIColor {
//
//    let aa = GetRandomColor()
//
//    let color = CGFloat()
//
//    let color = CGFloat(CGFloat(random())/CGFloat(RAND_MAX))
//    let color1 = CGFloat(CGFloat(random())/CGFloat(RAND_MAX))
//    let color2 = CGFloat(CGFloat(random())/CGFloat(RAND_MAX))
//
//    return UIColor(red: color, green: color1, blue: color2, alpha: 1);
//}
//创建渐变背景色
func GetGradientLayer(_ top: UIColor, bottom: UIColor) -> CAGradientLayer{
    
    let gradientColors: [CGColor] = [top.cgColor, bottom.cgColor]
    let gradientLocations: [CGFloat] = [0.0, 1.0]
    let gradientLayer: CAGradientLayer = CAGradientLayer()
    gradientLayer.colors = gradientColors
    gradientLayer.locations = gradientLocations as [NSNumber]?
    
    return gradientLayer
}

//func GetImageView(imageName: String? = nil, BackC: UIColor? = nil) -> UIImageView{
//    let  imageV = UIImageView()
//    if imageName != nil {
//        imageV.image = UIImage(named: imageName!)
//    }
//    imageV.backgroundColor = BackC
//    return imageV
//}

/// 是否登录
let USER_IS_LOGINED = "USER_IS_LOGINED"

/// 用户token
let USER_TOKEN = "USER_TOKEN"

/// 用户手机号
let USER_PNONENUM = "USER_PNONENUM"

/// 用户收藏的歌曲数

let USER_LIKECOUNT = "USER_LIKECOUNT"

let FreeUserCount = 10


let UserDefaults = Foundation.UserDefaults.standard
/// 获取用户token
func getUserToken() -> String {
    var newtoken: String! = ""
    if let   token = UserDefaults.object(forKey: USER_TOKEN) as? String {
        newtoken = token
    }
    return newtoken
}
func getHeaders() -> [String : String] {
    var accessToken: String! = ""
    if let token = UserDefaults.object(forKey: USER_TOKEN) as? String {
        accessToken = token
    }
    return ["Authorization": "Bearer \(accessToken!)"]
}

func getiPhoneNumber() -> String {
    var newtoken: String! = ""
    if let   token = UserDefaults.object(forKey: USER_PNONENUM) as? String {
        newtoken = token
    }
    return newtoken
}
func getLikeCount() -> Int {
    var newzcount: Int! = 0
    if let   zcount = UserDefaults.object(forKey: USER_LIKECOUNT) as? Int {
        newzcount = zcount
    }
    return newzcount
}

func addLikeCount() {
    let likecount =  getLikeCount() + 1
    UserDefaults.set(likecount, forKey: USER_LIKECOUNT)
}
func deleLikeCount() {
    let likecount =  getLikeCount() - 1
    UserDefaults.set(likecount, forKey: USER_LIKECOUNT)
}



//MARK: OTHER

//debug
func DebugPrint<T>(_ message: T) {
    print(message)
}

//成功回调的返回码
let SuccessStatusCode = 200


// 下载完成的歌曲在本地的文件夹
let DownloadedFolderName = "WAVE_Downloaded"


//歌手cell的宽
let  SingerCW = (ScreenWidth)/4
//歌手cell的高
let  SingerCH = AdaptationHeight(40)
//进度圈的宽高
let  ProgressWH = AdaptationWidth(267)
// 进度条的粗
let  ProgressBW = CGFloat(10)

///MARK: 数据库大小
let SongsCount = 10
///过滤数据

func GETSID(_ sid: String) -> String {
    let fullName = sid
    var fullNameArr =  fullName.characters.split{$0 == "-"}.map(String.init)
    return fullNameArr[0]
    //        var lastName: String? = fullNameArr.count > 1 ? fullNameArr[1] : nil
}


func getR(_ maxX: Float,minX: Float,maxR: Float,minR: Float,currentX: Float) -> Float {
    
    return minR + ((currentX - (maxX - minX)) * ((maxR - minR)/(maxX - minX)))
    
}
func getLeft(_ maxX: Float,minX: Float,maxR: Float,minR: Float,currentX: Float) -> Float {
    
    return minR + (((maxX - minX) - currentX) * ((maxR - minR)/(maxX - minX)))
    
}

func getX(_ maxX: Float,minX: Float,maxBGX: Float,minBGX: Float,currentX: Float) -> Float {
    
    return minBGX + ((currentX - (maxX - minX)) * ((maxBGX - minBGX)/(maxX - minX)))
    
}






//=============================================
