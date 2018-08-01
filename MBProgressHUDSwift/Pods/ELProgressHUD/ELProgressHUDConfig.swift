//
//  ELProgressHUDConfig.swift
//  ELProgressHUD
//
//  Created by Dylan on 2018/7/25.
//

import UIKit

class ELProgressHUDConfig: NSObject {

  
    // MARK: - 情景图片显示类型
    enum ELProgressHUDImageType {
        case Error
        case Info
        case Success
        case Warn
    }
//
//    static var image_Bundle: Bundle{
//        return Bundle.init(path:Bundle.init(for: ELProgressHUD.self).path(forResource: "ELProgressHUD", ofType: "bundle")!)!
//    }
//
//    // 定义一个静态变量arrowImage，用于获取图片文件：“arrow.png”。
//    static var arrowImage: UIImage{
//        return (UIImage.init(contentsOfFile: self.image_Bundle.path(forResource: "MBHUD_Error", ofType: "png")!)?.withRenderingMode(UIImageRenderingMode.alwaysTemplate))!
//    }
//
//

    private static let imageBundle = Bundle(url: Bundle(for: ELProgressHUD.self).url(forResource: "ELProgressHUD", withExtension: "bundle")!)
    
   
    
    static func bundleImage(_ imageType: ELProgressHUDImageType) -> UIImage? {
        var imageName: String!
        switch imageType {
        case .Error:
            imageName = "MBHUD_Error@2x"
        case .Info:
            imageName = "MBHUD_Info@2x"
        case .Success:
            imageName = "MBHUD_Success@2x"
        case .Warn:
            imageName = "MBHUD_Warn@2x"
        }

        return UIImage(contentsOfFile: (imageBundle?.path(forResource: imageName, ofType: "png"))!)
    }
}

typealias Config = ELProgressHUDConfig
