//
//  UIImage+CoreExtension.swift
//  CustomControl
//
//  Created by Corotata on 16/5/12.
//  Copyright © 2016年 Sun. All rights reserved.
//

import UIKit

extension UIImage {
    class func coro_image(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        
        let context = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }

}
