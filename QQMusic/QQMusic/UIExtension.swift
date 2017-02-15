//
//  UIExtension.swift
//  Pigs have spread
//
//  Created by 周逸文 on 17/2/13.
//  Copyright © 2017年 Devil. All rights reserved.
//

import Foundation
import UIKit

let ZYW_BC =  RGB(33, G: 176, B: 89)

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
    convenience init(zyw_nt nt: String? = nil,
                     ntc: UIColor = RGBSingle(176),
                     nn: String? = nil,
                     st: String? = nil,
                     stc: UIColor = RGBSingle(115),
                     sn: String? = nil,
                     ts: CGFloat = 14 ,
                     rd: CGFloat = 0,
                     bc: UIColor = RGB(33, G: 176, B: 89),
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
    convenience init(zyw_lt lt: String = "labeltitle",
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
extension UITextField {
    convenience init(zyw_pl pl: String = "Placeholder",
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
extension UITableView{
    
    convenience init(zyw_bc bc: UIColor = RGB(33, G: 176, B: 89),
                     any: Any,
                     rh: CGFloat = 50,style: UITableViewCellSeparatorStyle = .singleLine) {
        self.init()
        self.separatorStyle = style
        self.backgroundColor = bc
        self.tableFooterView = UIView()
        self.rowHeight = rh
        self.delegate = any as? UITableViewDelegate
        self.dataSource = any as? UITableViewDataSource
        
    }
    
}
extension UICollectionView{
    
    convenience init(zyw_bc bc: UIColor =  RGB(33, G: 176, B: 89),
                     any: Any,
                     isP: Bool = false) {
        self.init()
        self.backgroundColor = bc
        self.dataSource = any as? UICollectionViewDataSource
        self.delegate = any as? UICollectionViewDelegate
        self.isPagingEnabled = isP
        
    }
    
}

extension UICollectionViewFlowLayout{
    
    convenience init(zyw_si si: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                     sd: UICollectionViewScrollDirection = .horizontal,
                     mls: CGFloat = 0,
                     mis: CGFloat = 0,
                     ise: CGSize = CGSize(width: 50, height: 50) ) {
        self.init()
        self.sectionInset = si
        self.scrollDirection =  sd
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
