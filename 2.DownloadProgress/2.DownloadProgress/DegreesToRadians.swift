//
//  DegreesToRadians.swift
//  2.DownloadProgress
//
//  Created by Corotata on 16/5/16.
//  Copyright © 2016年 corotata. All rights reserved.
//

import UIKit

let π = CGFloat(M_PI)

func DegreesToRadians (value:CGFloat) -> CGFloat {
    return value * π / 180.0
}

func RadiansToDegrees (value:CGFloat) -> CGFloat {
    return value * 180.0 / π
}
