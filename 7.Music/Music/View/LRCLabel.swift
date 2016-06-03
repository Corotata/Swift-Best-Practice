//
//  LRCLabel.swift
//  Music
//
//  Created by Corotata on 16/6/2.
//  Copyright © 2016年 corotata. All rights reserved.
//

import UIKit

class LRCLabel: UILabel {
    var progress: CGFloat = 0{
        didSet{
            setNeedsDisplay()
        }
    }
    
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        let fillRect = CGRect(origin: CGPointZero, size: CGSize(width: bounds.size.width * progress, height: bounds.size.height))
        UIColor.greenColor().set()
        UIRectFillUsingBlendMode(fillRect, .SourceIn);
    }
}
