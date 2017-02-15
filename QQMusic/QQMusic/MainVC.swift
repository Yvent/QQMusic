
import UIKit

class MainVC: UITabBarController {
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        addChildViewControllers()
   
        setupUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        

        
    }
    
    func setupUI() {
     
        view.backgroundColor = UIColor.red
    
        
    }
}

extension MainVC {
//    func addChildViewControllers() {
//
//        addChildViewController(vc: HomeVC(), title: "首页", imageName: "tabbar_discover")
//        addChildViewController(vc: PostVC(), title: "录入", imageName: "tabbar_mine")
//        
//        addChildViewController(vc: MatchVC(), title: "匹配", imageName: "tabbar_mine")
//        
//        addChildViewController(vc: MessVC(), title: "消息", imageName: "tabbar_search")
//        addChildViewController(vc: MineVC(), title: "我的", imageName: "tabbar_account")
//    }
//    func addChildViewController(vc: UIViewController, title: String, imageName: String) {
//        vc.title = title
//
//        vc.tabBarItem.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
//        vc.tabBarItem.selectedImage = UIImage(named: imageName + "_selected")?.withRenderingMode(.alwaysOriginal)
//        
//        vc.tabBarItem.setTitleTextAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 18)], for: .normal)
//        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.black], for: .selected)
//        
//        let nav = UINavigationController(rootViewController: vc)
////        nav.navigationBar.phl_setBackgroundColor(NavColor)
//        //        nav.navigationBar.shadowImage = UIImage()
//        addChildViewController(nav)
//    }
}
