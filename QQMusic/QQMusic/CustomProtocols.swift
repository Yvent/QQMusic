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
    func zywdidcenterleftitem()
    func zywdidcenterrightitem()
    func zywsetBackView(backView: UIView)}

extension ZYWBackViewDelegate where Self: UIViewController{
    func zywdidleftitem() {
        print("Click leftitem")
    }
    func zywdidrightitem() {
        print("Click rightitem")
    }
    func zywdidcenterleftitem() {
        print("Click centerleftitem")
    }
    func zywdidcenterrightitem() {
        print("Click centerrightitem")
    }
    func zywsetBackView(backView: UIView) {
        self.view.addSubview(backView)
        backView.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(view)
            make.height.equalTo(64)
        }
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




