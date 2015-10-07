//
//  VisitorLoginView.swift
//  新浪微博
//
//  Created by sunlijian on 15/10/6.
//  Copyright © 2015年 myCompany. All rights reserved.
//

import UIKit

//创建一个代理
protocol VisitorViewDelegate :NSObjectProtocol{
    
    //注册的代理方法
    func visitorWillRegister()
    
    //登陆的代理方法
    func visitorWillLogin()

}


class VisitorLoginView: UIView {

    @IBOutlet weak var smallIcon: UIImageView!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var tipLable: UILabel!
   
    //设置当前类代理成员变量
    weak var delegate : VisitorViewDelegate?
    
    func setUIInfo(imageName name: String, tipText: String, isHome:Bool = false){
        iconView.image = UIImage(named: name)
        tipLable.text = tipText
        smallIcon.hidden = !isHome
        //判断是不是 Home 主页 如果是就执行动画
        if isHome {
            startAnimating()
        }
        
    }
    //动画
    private func startAnimating(){
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        anim.repeatCount = MAXFLOAT
        anim.duration = 15
        anim.toValue = 2 * M_PI
        //当动画处于非活跃状态移除图层
        anim.removedOnCompletion = false
        //添加动画
        smallIcon.layer.addAnimation(anim, forKey: nil)
    }
    
    
    //注册的点击事件
    @IBAction func registerAction(sender: AnyObject) {
        //代理执行此方法
        delegate?.visitorWillRegister()
    }

    @IBAction func loginAction(sender: AnyObject) {
        //代理执行方法
        delegate?.visitorWillLogin()
    }
}
