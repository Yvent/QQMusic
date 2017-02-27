//
//  UIExtension.swift
//  Pigs have spread
//
//  Created by 周逸文 on 17/2/13.
//  Copyright © 2017年 Devil. All rights reserved.
//

import Foundation
import UIKit

let YV_BC =  RGB(33, G: 176, B: 89)

/*
 1.创建便利构造函数
 2.使用面向协议编程
 3.UITextField 封装一个监听方法
 4.使用map函数代替for
 */
extension UIButton{
    
    //MARK:  convenience 的初始化方法是不能被子类重写或者是从子类中以 super 的方式被调用的
    /// 创建 UIButton
    ///
    /// - parameter nt:      normal title
    /// - parameter ts:      fontSize，默认 14
    /// - parameter ntc:     normal color，默认 darkGray
    /// - parameter nn:      normal imageNamed
    ///
    /// - returns: UILabel
    convenience init(yv_nt nt: String? = nil,
                     ntc: UIColor = RGBSingle(176),
                     nn: String? = nil,
                     st: String? = nil,
                     stc: UIColor = RGBSingle(115),
                     sn: String? = nil,
                     ts: CGFloat = 14 ,
                     rd: CGFloat = 0,
                     bc: UIColor? = nil,
                     bdc: CGColor = UIColor.red.cgColor,
                     bdw: CGFloat = 0) {
        self.init()
        if nn != nil {self.setImage(UIImage(named: nn!), for: .normal)}
        self.setTitle(nt, for: .normal)
        self.setTitleColor(ntc, for: .normal)
        
        if sn != nil {self.setImage(UIImage(named: sn!), for: .selected)}
        self.setTitle(st, for: .selected)
        self.setTitleColor(stc, for: .selected)
        self.titleLabel?.font = UIFont.systemFont(ofSize: ts)
        
        self.backgroundColor = bc
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
        self.layer.cornerRadius = rd
        self.layer.masksToBounds = true
        self.layer.borderColor = bdc
        self.layer.borderWidth = bdw
        // 自动调整大小
        sizeToFit()
    }
    
}
extension UILabel{
    /// 创建 UILabel
    ///
    /// - parameter lt:      text
    /// - parameter ts:  fontSize，默认 14
    /// - parameter ltc:     color，默认 darkGray
    /// - parameter alg: alignment，默认左对齐
    ///
    /// - returns: UILabel
    convenience init(yv_lt lt: String = "labeltitle",
                     ltc: UIColor = UIColor.darkGray,
                     ts: CGFloat = 14,
                     alg: NSTextAlignment = .left) {
        self.init()
        self.text = lt
        self.textColor = ltc
        self.textAlignment = alg
        self.font = UIFont.systemFont(ofSize: ts)
        self.numberOfLines = 0
        // 自动调整大小
        sizeToFit()
        
    }
    
}

extension UIImageView{
    convenience init(yv_named named: String,
                     rd: CGFloat = 0,
                     bc: UIColor = RGB(33, G: 176, B: 89),
                     bdc: CGColor = UIColor.red.cgColor,
                     bdw: CGFloat = 0) {
        self.init()
        self.image = UIImage(named: named)
        self.backgroundColor = bc
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
        self.layer.cornerRadius = rd
        self.layer.masksToBounds = true
        self.layer.borderColor = bdc
        self.layer.borderWidth = bdw
        self.clipsToBounds = true
        
    }

}
extension UITextField {
    convenience init(yv_pl pl: String = "Placeholder",
                     plc: UIColor = UIColor.red,
                     tc: UIColor = UIColor.darkGray,
                     kt:UIKeyboardType = .default  ,
                     ts: CGFloat = 14,
                     alg: NSTextAlignment = .left,
                     bc: UIColor = RGB(33, G: 176, B: 89),
                     rd: CGFloat = 0){
        self.init()
        
        self.attributedPlaceholder = NSAttributedString(string: pl, attributes: [
            NSForegroundColorAttributeName: plc as Any,
            NSFontAttributeName : UIFont.systemFont(ofSize: ts)
            ])
        self.keyboardType = kt
        self.textAlignment = alg
        self.textColor = tc
        self.backgroundColor = bc
        self.layer.cornerRadius = rd
        self.layer.masksToBounds = true
        
    }
}
let HomeSubviewHeight = ScreenHeight - 64 - 49

extension UIScrollView {

    
    convenience init(yv_bc bc: UIColor =  RGB(33, G: 176, B: 89),
                     any: Any,
                     isP: Bool = false,cs: CGSize = CGSize(width: ScreenWidth * 3,height: HomeSubviewHeight)) {
        self.init()
        self.backgroundColor = bc
        self.delegate = any as? UIScrollViewDelegate
        self.isPagingEnabled = isP
        self.scrollsToTop = false
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.contentSize = cs
        
    }
}
extension UITableView{
    
    convenience init(yv_bc bc: UIColor = RGB(33, G: 176, B: 89),
                     any: Any,
                     rh: CGFloat = 50,tabstyle: UITableViewStyle = .plain,style: UITableViewCellSeparatorStyle = .singleLine) {
        self.init(frame: CGRect.zero, style: tabstyle)
        self.separatorStyle = style
        self.backgroundColor = bc
//        self.tableHeaderView = UIView(frame: CGRect.zero)
        self.rowHeight = rh
        self.delegate = any as? UITableViewDelegate
        self.dataSource = any as? UITableViewDataSource
        
    }
    
}
extension UICollectionView{
    
    convenience init(yv_bc bc: UIColor =  RGB(33, G: 176, B: 89),
                     any: Any,
                     isP: Bool = false,layout: UICollectionViewLayout) {
        
        self.init(frame: CGRect.zero, collectionViewLayout: layout)
        self.backgroundColor = bc
        self.dataSource = any as? UICollectionViewDataSource
        self.delegate = any as? UICollectionViewDelegate
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.isPagingEnabled = isP
        
    }
    
}

extension UICollectionViewFlowLayout{
    
    convenience init(yv_si si: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                     sd: UICollectionViewScrollDirection? = nil,
                     mls: CGFloat = 0,
                     mis: CGFloat = 0,
                     ise: CGSize = CGSize(width: 50, height: 50) ) {
        self.init()
        self.sectionInset = si
        self.scrollDirection = sd == nil ? .horizontal : sd!
        self.minimumLineSpacing = mls
        self.minimumInteritemSpacing = mis
        self.itemSize = ise
    }
}

extension Date {
    /// "yyyy-MM-dd'T'HH:mm:ss"
    static var UTCDate: String {
        get {
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            return formatter.string(from: date)
        }
    }
    static var UTCDateZZ: String {
        get {
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
            return formatter.string(from: date)
        }
    }
    static var YearMonth: String {
        get {
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "YYYY/MM"
            return formatter.string(from: date)
        }
    }
    static func dateFromUTCstring(_ utc: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formatter.date(from: utc)
        DebugPrint(date)
        return date
    }
}
extension UINavigationController {
    func pushVCHT(_ vc: UIViewController) {
        vc.hidesBottomBarWhenPushed = true
        pushViewController(vc, animated: true)
    }
}
extension UIView {
    func addSubviews(_ views: Array<UIView>) {
        _ = views.map{addSubview($0)}
    }
    func isHiddenSubviews(_ views: Array<UIView>,ishidden: Bool) {
        _ = views.map{$0.isHidden = ishidden}
    }
}
extension UIImage {

    class func yv_singleDotImage(color: UIColor) -> UIImage {
        
        // 1. 开启上下文，需要注意 scale
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 1, height: 1), false, UIScreen.main.scale)
        
        // 2. 画图，填个颜色
        color.setFill()
        UIRectFill(CGRect(x: 0, y: 0, width: 1, height: 1))
        
        // 3. 从上下文获取图像
        let result = UIGraphicsGetImageFromCurrentImageContext()
        
        // 4. 关闭上下文
        UIGraphicsEndImageContext()
        
        // 5. 返回图像
        return result!
    }
    
    /// 异步绘制图像
    func yv_asyncDrawImage(size: CGSize,
                           isCorner: Bool = false,
                           backColor: UIColor? = UIColor.white,
                           finished: @escaping (_ image: UIImage)->()) {
        
        // 异步绘制图像，可以在子线程进行，因为没有更新 UI
        
         DispatchQueue.global().async {
            
            // 如果指定了背景颜色，就不透明
            UIGraphicsBeginImageContextWithOptions(size, backColor != nil, UIScreen.main.scale)
            
            let rect = CGRect(origin: CGPoint.zero, size: size)
            
            if backColor != nil{
                // 设置填充颜色
                backColor?.setFill()
                UIRectFill(rect)
            }
            
            // 设置圆角 - 使用路径裁切，注意：写设置裁切路径，再绘制图像
            if isCorner {
                let path = UIBezierPath(ovalIn: rect)
                
                // 添加裁切路径 - 后续的绘制，都会被此路径裁切掉
                path.addClip()
            }
            
            // 绘制图像
            self.draw(in: rect)
            
            let result = UIGraphicsGetImageFromCurrentImageContext()
            
            UIGraphicsEndImageContext()
            
            // 主线程更新 UI，提示：有的时候异步也能更新 UI，但是会非常慢！
            
            DispatchQueue.main.async {
                finished(result!)
            }
        }
    }
}

extension UIView{
   
    func yvDrawStaticCircle() {
        ///绘制静态圆
        let  StaticCayer = CAShapeLayer()
        StaticCayer.lineWidth = 2
        
        StaticCayer.strokeColor = RGBA(58, G: 193, B: 126, A: 1).cgColor
        
        StaticCayer.fillColor =  UIColor.clear.cgColor
        
        let Staticcenter = CGPoint(x: self.frame.size.width/2, y:  self.frame.size.height/2)
        let Staticradius: CGFloat = 15
        let StaticstartA = CGFloat(0)
        let StaticendA = CGFloat(M_PI_2 * 4)
        
        let Staticpath = UIBezierPath(arcCenter: Staticcenter, radius: Staticradius, startAngle: StaticstartA, endAngle: StaticendA, clockwise: true)
        
        StaticCayer.path = Staticpath.cgPath
        self.layer.addSublayer(StaticCayer)
        
        let DynamicCayer = CAShapeLayer()
        
        //        DynamicCayer.frame = CGRect(x: 0 , y: 0, width: ProgressWH, height: ProgressWH)
        DynamicCayer.lineWidth = 1.5
        
        DynamicCayer.strokeColor = RGBA(58, G: 193, B: 126, A: 1).cgColor
        
        DynamicCayer.fillColor = UIColor.clear.cgColor
        
        
        
        let center = CGPoint(x: self.frame.size.width/2, y:  self.frame.size.height/2)
        
        let radius: CGFloat = 15 - 1.5
        let startA = CGFloat(0)
        let endA = CGFloat(M_PI_2 * 4)
        
        
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: startA, endAngle: endA, clockwise: true)
        
        DynamicCayer.path = path.cgPath
        
        self.layer.addSublayer(DynamicCayer)
        DynamicCayer.strokeEnd = 0

        
    }
    func yvDrawDynamicCircle(progress: Float) {
        (self.layer.sublayers?.last as? CAShapeLayer)?.strokeEnd = CGFloat(progress)
    }
    
}
