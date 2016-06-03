//
//  CustomCell.swift
//  Music
//
//  Created by Corotata on 16/6/2.
//  Copyright © 2016年 corotata. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    var lrcLabel :LRCLabel?
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        lrcLabel = LRCLabel()
        lrcLabel?.textAlignment = .Center
        lrcLabel?.textColor = UIColor.whiteColor()
//        lrcLabel?.backgroundColor = UIColor.grayColor()
        backgroundColor = UIColor.clearColor()
        addSubview(lrcLabel!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        lrcLabel?.sizeToFit()
        
        lrcLabel?.center = CGPoint(x: bounds.size.width/2,y: bounds.size.height/2)
    }
    
}
