//
//  MusicLine.swift
//  Music
//
//  Created by Corotata on 16/6/2.
//  Copyright © 2016年 corotata. All rights reserved.
//

import UIKit

class MusicLine: NSObject {
    var text: String?
    var time: NSTimeInterval?
    
    init(lrcLineStr :NSString) {
        super.init()
        let array = lrcLineStr.componentsSeparatedByString("]")
        text = array[1]
        time = timeStringFormat(array[0].componentsSeparatedByString("[")[1])
    }
    
    
    func timeStringFormat(timeStr :NSString) -> NSTimeInterval{
        
        let minute: NSString = timeStr.substringWithRange(NSRange(location: 0, length: 2))
        let second: NSString = timeStr.substringWithRange(NSRange(location: 3, length: 2))
        let hs: NSString = timeStr.substringWithRange(NSRange(location: 6, length: 2))
        let time = minute.doubleValue * 60 + second.doubleValue + hs.doubleValue * 0.01
        return time
    }

}
