//
//  DYProgressHUDSwift.swift
//  MBProgressHUDSwift
//
//  Created by Dylan on 2018/7/4.
//  Copyright © 2018年 Dylan. All rights reserved.
//

import UIKit
import MBProgressHUD

public class ELProgressHUD: NSObject {
  
    //显示普通消息,带图
    /// 显示info
    ///
    /// - Parameters:
    ///   - title: titlew
    ///   - toView: view
   public class func showInfo(_ title: String,toView:UIView) {
        
        self.showCustomIcon(title, imageName: "MBHUD_Info", view: toView)
    }
    
    
    //显示成功消息带图片，带图
    /// 显示success
    ///
    /// - Parameters:
    ///   - title: title
    ///   - toView: view
   public class func showSuccess(_ title: String,toView:UIView) {
        
        self.showCustomIcon(title, imageName: "MBHUD_Success", view: toView)
    }
    
    
    /// 显示错误，带图
    ///
    /// - Parameters:
    ///   - title: message
    ///   - toView: view
   public class func showError(_ title: String,toView: UIView?) {
        
        self.showCustomIcon(title, imageName: "MBHUD_Error", view: toView)
        
    }
    
    
    /// 显示警告，带图
    ///
    /// - Parameters:
    ///   - title: message
    ///   - toView: view
   public class func showWarn(_ title: String,toView: UIView?) {
        
        self.showCustomIcon(title, imageName: "MBHUD_Warn", view: toView)
        
    }
    
    
    /// 显示菊花加载视图，不自动消失
    ///
    /// - Parameter View: view
   public class func showLoadToView(_ message:String,View:UIView?)  {
        
        self.showIconMessage(message, View: View ,RemainTime: 0)
    }
    
    
    /// 快速显示一条消息
    ///
    /// - Parameter message: message
   public class func showAutoMessage(_ message:String)  {
        
        self.showAutoMessage(message, View: nil)
    }
    
    
    
    
    /// 自定义停留时间有图[显示菊花]
    ///
    /// - Parameters:
    ///   - message: message
    ///   - View: view
    ///   - RemainTime: time
   public class func showIconMessage(_ message:String,View: UIView?,RemainTime:TimeInterval) {
        
        self.showMessage(message, View: View, RemainTime: RemainTime, Model: .indeterminate)
        
    }
    
    
    /// 自动消失文本，无图
    ///
    /// - Parameters:
    ///   - message: message
    ///   - View: view
    ///   - RemainTime: time
   public class func showAutoMessage(_ message:String,View: UIView?) {
        
        self.showMessage(message, View: View, RemainTime: 1.5, Model: .text)
        
    }
    /// 自定义停留时间,无图
    ///
    /// - Parameters:
    ///   - message: message
    ///   - View: view
    ///   - RemainTime: time
   public class func showMessage(_ message:String,View: UIView?,RemainTime:TimeInterval) {
        
        self.showMessage(message, View: View, RemainTime: RemainTime, Model: .text)
        
    }
    
    /// 显示不带图片的信息
    ///
    /// - Parameters:
    ///   - message: 消息
    ///   - View: view
    ///   - RemainTime: 隐藏时间
    ///   - Model: 显示的类型【MBHUD四种模型】
   public class func showMessage(_ message:String,View: UIView?,RemainTime:TimeInterval,Model:MBProgressHUDMode) {
        
        var temp_View = View
        
        if temp_View == nil {
            
            temp_View = viewToShow()
        }
        
        let hud = MBProgressHUD.showAdded(to: temp_View!, animated: true)
        
        hud.backgroundView.style = .blur  //模糊的遮罩背景
        
        hud.dimBackground = true
        
        //        //设置菊花框为白色
        //        if #available(iOS 9.0, *) {
        //
        //            UIActivityIndicatorView.appearance(whenContainedInInstancesOf:
        //                [MBProgressHUD.self]).color = .white
        //
        //        } else {
        
        hud.activityIndicatorColor = UIColor.white
        //        }
        
        hud.mode = Model
        hud.label.text = message
        hud.label.textColor = UIColor.white
        //       //  正方形
        //       hud.isSquare = true
        //
        if #available(iOS 10.0, *) {
            hud.bezelView.backgroundColor = UIColor.init(displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 0.8)
        } else {
            hud.contentColor = UIColor.darkGray
            hud.alpha = 0.8
        }
        
        hud.removeFromSuperViewOnHide = true
        
        //  给hud添加手势
        self.addTouchToHUD(hud: hud)
        
        //  判断是不是需要自动消失
        if  RemainTime > 0.0 {
            
            hud.hide(animated: true, afterDelay: RemainTime)
        }
        
        
    }
    
    
    /// 显示带图片的信息
    ///
    /// - Parameters:
    ///   - title: message
    ///   - imageName: imageName
    ///   - view: view
   public class func showCustomIcon(_ title:String,imageName:String, view: UIView?) {
        //  隐藏loading
        var temp_View = view
        
        self.hidehudForView(view: temp_View)
        
        if temp_View == nil {
            
            temp_View = viewToShow()
        }
        let hud = MBProgressHUD.showAdded(to: temp_View!, animated: true)
        
        hud.dimBackground = true
        
        hud.mode = .customView
        hud.label.text = title
        
        hud.customView = UIImageView(image: UIImage(named: imageName))
        
        if #available(iOS 10.0, *) {
            hud.bezelView.backgroundColor = UIColor.init(displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 0.8)
        } else {
            hud.contentColor = UIColor.darkGray
            hud.alpha = 0.8
        }
        
        hud.label.textColor = UIColor.white
        
        hud.removeFromSuperViewOnHide = true
        
        hud.hide(animated: true, afterDelay: 1.5)
    }
    
    /// 隐藏view
   public class  func hidehudForView(view:UIView?){
        
        if view==nil {
            
            MBProgressHUD.hide(for: viewToShow(), animated: true)
            
        }else{
            
            MBProgressHUD.hide(for: view!, animated: true)
        }
        
    }
    
    //    /// 隐藏view
    //   public class func hideHud() {
    //
    //        self.hidehudForView(view: nil)
    //    }
    
    
    /// 给hud添加手势，点击即可消失
   public class  func addTouchToHUD(hud:MBProgressHUD) {
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(self.TapAction(Tapgesture:)))
        
        hud .addGestureRecognizer(tap)
    }
    
    @objc  public class func TapAction(Tapgesture:UITapGestureRecognizer) {
        
        let hud = Tapgesture.view as? MBProgressHUD
        
        if hud == nil && (hud?.isHidden)! {
            //
            
        }else{
            
            hud?.hide(animated: true)
        }
    }
    
    
    //获取用于显示提示框的view
   public class func viewToShow() -> UIView {
        var window = UIApplication.shared.keyWindow
        if window?.windowLevel != UIWindowLevelNormal {
            let windowArray = UIApplication.shared.windows
            for tempWin in windowArray {
                if tempWin.windowLevel == UIWindowLevelNormal {
                    window = tempWin;
                    break
                }
            }
        }
        
        return window!
    }
}
