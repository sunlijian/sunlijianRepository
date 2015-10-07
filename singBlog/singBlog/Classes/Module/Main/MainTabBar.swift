//
//  MainTabBar.swift
//  新浪微博
//
//  Created by sunlijian on 15/10/6.
//  Copyright © 2015年 myCompany. All rights reserved.
//

import UIKit

class MainTabBar: UITabBar {

    //调用 layoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var index :CGFloat = 0
        //tabBarItem 的宽
        let w = UIScreen.mainScreen().bounds.width / 5
        //tabBarItem的高
        let h = self.bounds.height
        //tabBarItem的大小
        let bounds = CGRectMake(0, 0, w, h)
        //遍历
        for view in subviews {
            //如果子控件不是 button 的时候
            if view is UIControl && !(view is UIButton){
                view.frame = CGRectOffset(bounds, index * w, 0)
                
                index += (index == 1 ? 2 : 1)
            }
        }
        
        //添加一个 button
        composeButton.frame = CGRectOffset(bounds, 2 * w, 0)
       
    }
    //懒加载 button
    lazy var composeButton: UIButton = {
        let btn = UIButton(type: UIButtonType.Custom)
        //设置 btn 的背景图片
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: UIControlState.Highlighted)
        //设置 btn 的 图片
        btn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: UIControlState.Highlighted)
        btn.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: UIControlState.Normal)
        
        self.addSubview(btn)
        return btn
    }()
}
