//
//  MainTabBarController.swift
//  新浪微博
//
//  Created by sunlijian on 15/10/6.
//  Copyright © 2015年 myCompany. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    @IBOutlet weak var mainTabBar: MainTabBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        //添加 storyboard
        addChildControllers()
        

        
        mainTabBar.composeButton.addTarget(self, action: "clickButton:", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    //中间 button 的点击事件
    func clickButton(sender: UIButton){
        print(sender)
    }
    
    
    //添加 tabBar对应的storyboard
    private func addChildControllers(){
        //设置 tabBar 的字体
        tabBar.tintColor = UIColor.orangeColor()
        //添加首页
        addChildController("Home", "首页", "tabbar_home")
        //添加 message
        addChildController("Message", "消息", "tabbar_message_center")
        //添加 发现
        addChildController("Discover", "发现", "tabbar_discover")
        //添加我
        addChildController("Profile", "我", "tabbar_profile")
    }
    
    
    //添加单个视图
    private func addChildController(name:String, _ title:String, _ imageName:String){
        //加载storyboard
        let storyboard = UIStoryboard(name: name, bundle: nil)
        //设置对应的导航
        let nav = storyboard.instantiateInitialViewController() as! UINavigationController
        //设置导航的 title
        nav.topViewController?.title = title
        //设置 tabBar 的图片
        nav.tabBarItem.image = UIImage(named: imageName)
        //
        //添加到当前的 tabBar 上
        addChildViewController(nav)
        
    }
    
}

