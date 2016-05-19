//
//  DownloadProgress.swift
//  2.DownloadProgress
//
//  Created by Corotata on 16/5/16.
//  Copyright © 2016年 corotata. All rights reserved.
//

import UIKit

class DownloadProgress: UIView {
    var progress : CGFloat = 0.0{
        didSet{
            setNeedsDisplay()
        }
    }
    
    override func drawRect(rect: CGRect) {
        let point = CGPoint(x: rect.size.width/2, y: rect.size.height/2)
        
        let startAngle = DegreesToRadians(-90)
        
        let endAngle = DegreesToRadians(360.0 * progress - 90)

        let path = UIBezierPath(arcCenter: point, radius: rect.size.width/2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        path.stroke()
    }
}
