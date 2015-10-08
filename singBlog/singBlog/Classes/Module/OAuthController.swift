//
//  OAuthController.swift
//  singBlog
//
//  Created by sunlijian on 15/10/8.
//  Copyright © 2015年 myCompany. All rights reserved.
//

import UIKit
import SVProgressHUD
//App Key：1520523895

//App Secret：86a54789f611c92264b610cd671ee17e

//https://api.weibo.com/oauth2/authorize

//client_id	    string	申请应用时分配的AppKey。
//redirect_uri	string	授权回调地址，站外应用需与设置的回调地址一致，站内应用需填写canvas page的地

//请求
//https://api.weibo.com/oauth2/authorize?client_id=123050457758183&redirect_uri=http://www.example.com/response&response_type=code

class OAuthController: UIViewController,UIWebViewDelegate {
    
    
    let client_id = "1520523895"
    let redirect_uri = "http://www.baidu.com"
    let pageURL = "https://api.weibo.com/oauth2/authorize"
    
    
    //获取一个 webView
    var webView :UIWebView {
        get{
            return view as! UIWebView
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //加载 OAuthPage
        loadOAuthpage()
    }
    
    //开始请求
    private func loadOAuthpage(){
        
        webView.loadRequest(NSURLRequest(URL: NetWorkTools.sharedTools.oAuthURL()))
    }
    
    
    //当开始加载请求的时候的会调用此方法
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        //获取要加载 请求的网址
        let urlString = request.URL!.absoluteString
        
        //如果有 urlString 有 api.weibo.com 开头的子字符
        if urlString.hasPrefix("https://api.weibo.com/") {
            return true
        }
        
        // 如果没有 www.baidu.com 回调页 就返回false
        if !urlString.hasPrefix(NetWorkTools.sharedTools.redirect_uri) {
            return false
        }
        
        //走到这 说明有 www.baidu.com
        if let query = request.URL?.query{
            let codeStr = "coder"
            
            let code = (query as NSString).substringFromIndex(codeStr.characters.count)
            
            //请求acessToken
            NetWorkTools.sharedTools.loadAccessToken(code)
        }
        return false
    }
    
    
    
    
    

    //点击关闭方法
    @IBAction func closeItem(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //点击自动登陆
    @IBAction func autoLoginItem(sender: AnyObject) {
        
        let jsstring = "document.getElementById('userId').value = '366799188@qq.com';document.getElementById('passwd').value = '2431009'"
        webView.stringByEvaluatingJavaScriptFromString(jsstring)
    }
    
    
    //当加载开始的时候
    func webViewDidStartLoad(webView: UIWebView) {
        SVProgressHUD.show()
    }
    //当加载完的时候
    func webViewDidFinishLoad(webView: UIWebView) {
        let jsstring = "document.title"
        let webTitle = webView.stringByEvaluatingJavaScriptFromString(jsstring)
        title = webTitle
        
        SVProgressHUD.dismiss()
    }

}
