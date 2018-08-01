//
//  ViewController.swift
//  ELProgressHUDSwift
//
//  Created by Dylan on 2018/7/4.
//  Copyright © 2018年 Dylan. All rights reserved.
//

import UIKit
import ELProgressHUD

class ViewController: UIViewController {

//    var elp:ELProgressHUD!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func showinfo(_ sender: Any) {
         print("showinfo");
        
        ELProgressHUD.showInfo("showInfo")
//        DYAlertControllerTool.showAlert(currentVC: self, title:"title", meg: "msg", cancelBtn: "cancel", otherBtn: "other") { (action) in
//            print("click")
//        }
//        DYAlertControllerTool.showAlert(currentVC: self, cancelBtn: "關閉", meg: "msg", title: "title")
        
//        DYAlertControllerTool.showAlert(currentVC: self, title: "title", meg: "msg", cancelBtn: "cancel", otherBtn: "other", cencelHandler: { (action) in
//              print("cancekl")
//        }) { (action) in
//              print("ok ")
//        }
    }
    
    @IBAction func Click_Success(_ sender: Any) {
        print("Click_Success");
        ELProgressHUD.showSuccess("showSuccess")
    }
    
    
   
    @IBAction func click_Error(_ sender: Any) {
        print("click_Error");
 
        
        ELProgressHUD.showError("showError")
        
    }
    
    
    @IBAction func click_Warn(_ sender: Any) {
        print("click_Warn")
        ELProgressHUD.showWarn("showWarn")
    }
    
    
    @IBAction func showLoadtoView(_ sender: Any) {
        
         print("showLoadtoView");
        ELProgressHUD.showLoadToView("上转中")
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
            
            ELProgressHUD.hideHud()
//            ELProgressHUD.hideHud()
        }
        
        
    }
    
    
    @IBAction func showAutoMessage(_ sender: Any) {
         print("showAutoMessage");
//        ELProgressHUD.showAutoMessage("showAutoMessage")
    }
    
    
    @IBAction func showIconMessage(_ sender: Any) {
        
         print("showIconMessage");
        ELProgressHUD.showIconMessage("showIconMessage", RemainTime: 5)
        
    }
    @IBAction func showAutoMessage_2(_ sender: Any) {
        
         print("showAutoMessage_2");
        ELProgressHUD.showAutoMessage("showAutoMessage_2")
        
    }
   
    
    @IBAction func showMessage(_ sender: Any) {
         print("showMessage");
        ELProgressHUD.showMessage("showMessage",RemainTime: 1.5)
    }
    
    @IBAction func hidehudForView(_ sender: Any) {
        print("hidehudForView");
      
        ELProgressHUD.hideHud()
    }
    @IBAction func hideHud(_ sender: Any) {
        
            print("hideHud");
//        ELProgressHUD.hideHud()
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  
    
}

