//
//  UIColor+CoreExtension.swift
//  MoreConciseSwift
//
//  Created by Corotata on 16/5/12.
//  Copyright © 2016年 Corotata. All rights reserved.
//

import UIKit

extension UIColor {
    //把给定的十六进制颜色值进行转化
    class func coro_color(hexValue: NSInteger) -> UIColor{
        let alpha :CGFloat = 1
        return UIColor.coro_color(hexValue, aAlpha: alpha)
    }
    
    
     //把给定的十六进制颜色值进行转化
    class func coro_color(hexValue: NSInteger,aAlpha: CGFloat) -> UIColor{
        return UIColor(red: ((CGFloat)((hexValue&0xFF0000)>>16))/255.0, green: ((CGFloat)((hexValue&0xFF00)>>8))/255.0, blue: ((CGFloat)(hexValue&0xFF))/255.0, alpha: aAlpha)
    }
    

    
    
    
}