//
//  CustomProtocols.swift
//  Pigs have spread
//
//  Created by 周逸文 on 17/2/8.
//  Copyright © 2017年 Devil. All rights reserved.
//

import Foundation
import UIKit

///'class' not have will error
protocol ZYWBackViewDelegate: class {

    func zywdidleftitem()
    func zywdidrightitem()
    func zywsetBackView(backView: UIView)}

extension ZYWBackViewDelegate where Self: UIViewController{
    func zywdidleftitem() {
        print("Click leftitem")
    }
    func zywdidrightitem() {
        print("Click rightitem")
    }
    func zywsetBackView(backView: UIView) {
        self.view.addSubview(backView)
        backView.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(view)
            make.height.equalTo(64)
        }
    }
}















//MARK: about CustomBackview====================
protocol LeftBackview {
    var BackView: UIView! { get set }
    var LeftBtn: UIButton! { get set }
    var TitleLabel: UILabel! { get set }
    
    func setLeftBackview(title: String?,leftTitle: String?)
}

extension LeftBackview where Self: UIViewController {
    func setLeftBackview(title: String?,leftTitle: String?) {
        
        BackView.backgroundColor = UIColor.black
        LeftBtn.setTitle(leftTitle, for: .normal)
        
        TitleLabel.text = title
        TitleLabel.textAlignment = .center
        TitleLabel.textColor = UIColor.white
        
        view.addSubview(BackView)
        view.addSubviews([LeftBtn,TitleLabel])
        BackView.snp.makeConstraints { (make) in
            make.left.equalTo(view)
            make.top.equalTo(view)
            make.right.equalTo(view)
            make.height.equalTo(64)
        }
        LeftBtn.snp.makeConstraints { (make) in
            make.left.equalTo(BackView).offset(10)
            make.top.equalTo(BackView).offset(20)
            make.width.equalTo(44)
            make.height.equalTo(44)
        }
        TitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(BackView).offset(20)
            make.centerX.equalTo(BackView.snp.centerX)
            make.width.equalTo(AdaptationWidth(200))
            make.bottom.equalTo(BackView)
        }
        
    }
}
protocol CustomBackview: LeftBackview {
    var RightBtn: UIButton! { get set }
}
extension CustomBackview where Self: UIViewController {
    func setBackview(title: String?, leftTitle: String?,rightTitle: String?) {
        self.setLeftBackview(title: title, leftTitle: leftTitle)
        RightBtn.setTitle(rightTitle, for: .normal)
        view.addSubview(RightBtn)
        RightBtn.snp.makeConstraints { (make) in
            make.right.equalTo(BackView).offset(-10)
            make.top.equalTo(BackView).offset(20)
            make.width.equalTo(44)
            make.height.equalTo(44)
        }
    }
}

//MARK: about CustomUI====================
protocol TitlePresentable {
    var titleLabel: UILabel! { get set }
    func setTitle(title: String?,tColor: UIColor?,tSize: CGFloat)
}
extension TitlePresentable {
    func setTitle(title: String? = nil,tColor: UIColor?,tSize: CGFloat) {
        titleLabel.text = title
        titleLabel.textColor = tColor
        titleLabel.font = UIFont.systemFont(ofSize: tSize)
    }
}

protocol SubTitlePresentable {
    var subtitleLabel: UILabel! { get set }
    func setSubTitle(title: String?,tColor: UIColor?,tSize: CGFloat)
}
extension SubTitlePresentable {
    func setSubTitle(title: String? = nil,tColor: UIColor?,tSize: CGFloat) {
        subtitleLabel.text = title
        subtitleLabel.textColor = tColor
        subtitleLabel.font = UIFont.systemFont(ofSize: tSize)
    }
   }

protocol TwoSubTitlePresentable {
    var twoSubtitleLabel: UILabel! { get set }
    func setTwoSubTitle(title: String?,tColor: UIColor?,tSize: CGFloat)
}
extension TwoSubTitlePresentable {
    func setTwoSubTitle(title: String? = nil,tColor: UIColor?,tSize: CGFloat) {
        twoSubtitleLabel.text = title
        twoSubtitleLabel.textColor = tColor
        twoSubtitleLabel.font = UIFont.systemFont(ofSize: tSize)
    }
}

protocol TextFieldPresentable {
    var textField: UITextField! { get set }
    func setTextField(placeholder: String?)
}
extension TextFieldPresentable {
    func setTextField(placeholder: String? = nil) {
        textField.placeholder = placeholder
    }
}

protocol HeadImageBtnPresentable {
    var headImageBtn: UIButton { get set }
    func setHeadImageBtn(title: String?, named: String?, radius: CGFloat?,bColor: UIColor?,tColor: UIColor?)
}

extension HeadImageBtnPresentable {
    func setHeadImageBtn(title: String? = nil, named: String? = nil, radius: CGFloat? = nil,bColor: UIColor? = nil,tColor: UIColor? = nil) {
        if named != nil {headImageBtn.setImage(UIImage(named: named!), for: .normal)}
        headImageBtn.setTitle(title, for: .normal)
        headImageBtn.setTitleColor(tColor, for: .normal)
        headImageBtn.backgroundColor = bColor
        headImageBtn.contentMode = .scaleAspectFill
        headImageBtn.clipsToBounds = true
        headImageBtn.layer.cornerRadius = radius == nil ? 0:radius!
        headImageBtn.layer.masksToBounds = true
    }
}

protocol SubBtnPresentable {
    var subBtn: UIButton! { get set }
    func setSubBtn(title: String?, named: String?, radius: CGFloat?,bColor: UIColor?,tColor: UIColor?)
}

extension SubBtnPresentable {
    func setSubBtn(title: String? = nil, named: String? = nil, radius: CGFloat? = nil,bColor: UIColor? = nil,tColor: UIColor? = nil) {
        if named != nil {subBtn.setImage(UIImage(named: named!), for: .normal)}
        subBtn.setTitle(title, for: .normal)
        subBtn.setTitleColor(tColor, for: .normal)
        subBtn.backgroundColor = bColor
        subBtn.contentMode = .scaleAspectFill
        subBtn.clipsToBounds = true
        subBtn.layer.cornerRadius = radius == nil ? 0:radius!
        subBtn.layer.masksToBounds = true
    }
}

//MARK: 关于 UITABLEVIEW====================
protocol NibLoadableView: class { }

extension NibLoadableView where Self: UIView {
    
    static var NibName: String {
        return String(describing: self)
    }
}

//MARK: 关键字class=此协议针对类
protocol ReusableView: class {}
//MARK: where = self 和 UIView 的联系，这里的self指具体的cell
extension ReusableView where Self: UIView {
    
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}
extension UITableViewCell: ReusableView {}

extension UITableView {
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView {
        
        register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
        
    }
    //    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
    //
    //        let Nib = UINib(nibName: T.NibName, bundle: nil)
    //        register(Nib, forCellReuseIdentifier: T.defaultReuseIdentifier)
    //    }
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        return cell
    }
}


protocol TableViewFolding { }



class HeaderForSection: UIView {
  
//     var didSelect: (()->())?
    var inSection = 0
    var isCurrentOen = false
    
    var didSelect: (_ zind: Int) -> () = { _ in }
    
    init(InSection: Int) {
       super.init(frame: CGRect.zero)
        inSection = InSection
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(HeaderForSection.onTapped))
        self.addGestureRecognizer(tapGesture)
    }
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(HeaderForSection.onTapped))
//       self.addGestureRecognizer(tapGesture)
//    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func onTapped() {
    
       didSelect(inSection)
    }
}
extension UITableViewDelegate {

    func folding(tableView: UITableView, viewForHeaderInSection: Int) {
        
        let  v =  self.tableView!(tableView, viewForHeaderInSection: viewForHeaderInSection) as! HeaderForSection
        v.didSelect = {(_ cind: Int)  in

        print("aaa")
            
            
            
        }
    
        
    }
    
}

