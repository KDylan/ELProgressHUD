//
//  DYAlertControllerTool.swift
//  MBProgressHUDSwift
//
//  Created by Dylan on 2018/7/20.
//  Copyright © 2018年 Dylan. All rights reserved.
//


import Foundation
import UIKit

class DYAlertControllerTool {
    /**
     alterController 两个按钮 处理otherBtn事件
     
     - parameter currentVC: 当前控制器
     - parameter meg:       提示消息
     - parameter cancelBtn: 取消按钮
     - parameter otherBtn:  其他按钮
     - parameter handler:   其他按钮处理事件
     */
    static func showAlert(currentVC:UIViewController,title:String, meg:String, cancelBtn:String, otherBtn:String?, handler:((UIAlertAction) -> Void)?){
        //        guard let vc = self.getCurrentVC() else{ return }
        //        dispatch_async(DispatchQueue.main, { () -> Void in
        let alertController = UIAlertController(title:title,
                                                message:meg ,
                                                preferredStyle: .alert)
        let cancelAction = UIAlertAction(title:cancelBtn, style: .cancel, handler:nil)
        
        alertController.addAction(cancelAction)
        
        if otherBtn != nil{
            let settingsAction = UIAlertAction(title: otherBtn, style: .default, handler: { (action) -> Void in
                handler?(action)
            })
            alertController.addAction(settingsAction)
        }
        currentVC.present(alertController, animated: true, completion: nil)
        //        })
    }
    
    
    
    /**
     alterController 一个按钮 不处理事件，简单实用
     
     - parameter currentVC: 当前控制器
     - parameter meg:       提示消息
     */
    static func showAlert(currentVC:UIViewController, cancelBtn:String, meg:String,title:String){
        
//        showAlert(currentVC, meg: meg, cancelBtn: cancelBtn, otherBtn: nil, handler: nil)
        showAlert(currentVC: currentVC, title: title, meg: meg, cancelBtn: cancelBtn, otherBtn: nil, handler: nil)
    }
    
    
    /**
     两个按钮 都处理事件
     
     - parameter currentVC:     当前控制器
     - parameter meg:           提示消息
     - parameter cancelBtn:     取消按钮
     - parameter otherBtn:      其他按钮
     - parameter cencelHandler: 取消按钮事件回调 （不处理可不写，考虑到有些场合需要使用）
     - parameter handler:       其他按钮事件回调
     */
    static func showAlert(currentVC:UIViewController,title:String, meg:String, cancelBtn:String, otherBtn:String?,cencelHandler:((UIAlertAction) -> Void)?, handler:((UIAlertAction) -> Void)?){
        //        dispatch_async(dispatch_get_main_queue(), { () -> Void in
        let alertController = UIAlertController(title:title,
                                                message:meg ,
                                                preferredStyle: .alert)
        let cancelAction = UIAlertAction(title:cancelBtn, style: .cancel, handler:{ (action) -> Void in
            cencelHandler?(action)
        })
        alertController.addAction(cancelAction)
        if otherBtn != nil{
            let settingsAction = UIAlertAction(title: otherBtn, style: .default, handler: { (action) -> Void in
                handler?(action)
            })
            alertController.addAction(settingsAction)
        }
        currentVC.present(alertController, animated: true, completion: nil)
        //        })
    }
}
