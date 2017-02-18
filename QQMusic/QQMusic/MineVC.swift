//
//  MineVC.swift
//  QQMusic
//
//  Created by 周逸文 on 17/2/16.
//  Copyright © 2017年 Devil. All rights reserved.
//

import UIKit
let MinePlayerFuncCellHeight: CGFloat = 210
class MineVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

//    var tabheghts = [[130,210],[],[]]
    
    private var tabv: UITableView!
   
    private var titles = [["个性电台","NIKE跑步电台"],["我最爱听","默认列表"]]
    private var subtitles = [["来听听和我记得我爱过一样好听的歌...","新增万首中文跑步歌曲"],["0首","7首"]]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        initUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private func initUI() {
        tabv = UITableView(zyw_bc: RGBSingle(229), any: self,tabstyle: .grouped)
        tabv.register(UITableViewCell.self)
        
        view.addSubview(tabv)
        tabv.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else{
        return 2
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
        
        return MineHeadImageCell()
         
        }
        let cell = MineRadioCell()
        cell.title.text = titles[indexPath.section - 1][indexPath.row]
        cell.subtitle.text = subtitles[indexPath.section - 1][indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
         
            return 132 + MinePlayerFuncCellHeight
            
        }else{
        return MineRadioCellHeight
        }
        
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
}
