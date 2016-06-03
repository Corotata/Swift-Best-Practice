//
//  CustomPlantProgress.swift
//  4.CustomPlantProgress
//
//  Created by Corotata on 16/5/25.
//  Copyright © 2016年 corotata. All rights reserved.
//

import UIKit

class CustomPlantProgress: UIView {
    
    let shapeLayer = CAShapeLayer()
    let plantLayer = CALayer()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let backgroundImage = UIImageView(image: UIImage(named: "refresh-view-bg"))
        backgroundImage.frame = bounds
        backgroundImage.contentMode = .ScaleAspectFill
        backgroundImage.clipsToBounds = true
        backgroundImage.backgroundColor = UIColor.blackColor()
        backgroundImage.layer.cornerRadius = 30
        addSubview(backgroundImage)
        
        print(subviews)
        
        
        
        shapeLayer.strokeColor = UIColor.whiteColor().CGColor
        shapeLayer.fillColor = UIColor.clearColor().CGColor
        shapeLayer.lineWidth = 4
        shapeLayer.lineDashPattern = [2,3]
        let refreshRadius = frame.size.height/2 * 0.8
        
        let rect = CGRect(x: frame.size.width/2 - refreshRadius, y: frame.size.width/2 - refreshRadius, width: refreshRadius * 2, height: refreshRadius * 2)
        shapeLayer.path = UIBezierPath(ovalInRect: rect).CGPath
        layer.addSublayer(shapeLayer)
        
        
        
        
        let plantImage = UIImage(named: "airplane.png")!
        plantLayer.contents = plantImage.CGImage
        plantLayer.bounds = CGRect(x: 0, y: 0, width: plantImage.size.width, height: plantImage.size.height)
        plantLayer.position = CGPoint(x: frame.size.width - frame.size.width/2 - refreshRadius , y: bounds.size.width/2)
        layer.addSublayer(plantLayer)
        
        
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func startAnimal(){
        
        let strokeStartAnimation = CABasicAnimation(keyPath: "strokeStart")
        strokeStartAnimation.fromValue = -0.5
        strokeStartAnimation.toValue = 1.0
        
        let strokeEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeEndAnimation.fromValue = 0.0
        strokeEndAnimation.toValue = 1.0
        
        let strokeAnimationGroup = CAAnimationGroup()
        strokeAnimationGroup.duration = 2
        strokeAnimationGroup.repeatDuration = CFTimeInterval(MAXFLOAT)

        strokeAnimationGroup.animations = [strokeStartAnimation, strokeEndAnimation]
        shapeLayer.addAnimation(strokeAnimationGroup, forKey: nil)
        
        let flightAnimation = CAKeyframeAnimation(keyPath: "position")
        flightAnimation.path = shapeLayer.path
        flightAnimation.calculationMode = kCAAnimationPaced
        
        let airplaneOrientationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        airplaneOrientationAnimation.fromValue = 0
        airplaneOrientationAnimation.toValue = 2 * M_PI
        
        let flightAnimationGroup = CAAnimationGroup()
        flightAnimationGroup.duration = 2
        flightAnimationGroup.repeatDuration = CFTimeInterval(MAXFLOAT)
        flightAnimationGroup.animations = [flightAnimation, airplaneOrientationAnimation]
        plantLayer.addAnimation(flightAnimationGroup, forKey: nil)
    
    }
    
    
    
    
    

}
