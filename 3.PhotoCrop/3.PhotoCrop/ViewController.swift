//
//  ViewController.swift
//  3.PhotoCrop
//
//  Created by Corotata on 16/5/17.
//  Copyright © 2016年 corotata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let image = UIImage(named: "123")
    
    
    

    @IBOutlet weak var imageView: UIImageView!
    
    
    
    @IBAction func roundRectButtonClick(sender: UIButton) {
        
        var currentImage :UIImage
        
        UIGraphicsBeginImageContextWithOptions(image!.size, false, 0)
        
        let path = UIBezierPath(roundedRect: CGRect(origin: CGPointZero, size: image!.size), cornerRadius: image!.size.width * 0.25)
        path.addClip();
        
        image!.drawInRect(CGRect(origin: CGPointZero,size: image!.size))
        
       
        currentImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        imageView.image = currentImage

    }
    
    
    @IBAction func circleButtonClick(sender: UIButton) {
        
        var currentImage :UIImage
        
        UIGraphicsBeginImageContextWithOptions(image!.size, false, 0)
        
        let path = UIBezierPath(roundedRect: CGRect(origin: CGPointZero, size: image!.size), cornerRadius: image!.size.width * 0.5)
        path.addClip();
        
        image!.drawInRect(CGRect(origin: CGPointZero,size: image!.size))
        
        
        currentImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        imageView.image = currentImage

    }
    
    
    @IBAction func benevolenceButtonClick(sender: UIButton) {
        
        
        var currentImage :UIImage
        UIGraphicsBeginImageContextWithOptions(image!.size, false, 0)
        //上面的两个半圆 半径为整个frame的四分之一
        
        let radius = image!.size.width * 0.25
        let path = UIBezierPath()
        
        //左侧圆的圆心
        let leftLoveCenterPoint = CGPoint(x: radius, y: radius)
        path.addArcWithCenter(leftLoveCenterPoint, radius: radius, startAngle: CGFloat(-M_PI), endAngle: 0, clockwise: true)
        
        
        //右侧圆的圆心
        let rightLoveCenterPoint = CGPoint(x: 3 * radius, y: radius)
        path.addArcWithCenter(rightLoveCenterPoint, radius: radius, startAngle: CGFloat(-M_PI), endAngle: 0, clockwise: true)
        
        //底部中心
        let bottomCenterPoint = CGPoint(x: image!.size.width/2,y: radius * 4)
        
        let leftLoveStardPoint = CGPoint(x: 0, y:radius)
        //        let rightLoveEndPoint = CGPoint(x: rect.size.width, y:radius)
        
        //画由右侧连底部的弧线
        path.addQuadCurveToPoint(bottomCenterPoint, controlPoint: CGPoint(x: image!.size.width, y: image!.size.height * 0.6))
        
        //画由底部连左侧的弧线
        path.addQuadCurveToPoint(leftLoveStardPoint, controlPoint: CGPoint(x: 0, y: image!.size.height * 0.6))
        path.addClip()
        
        image!.drawInRect(CGRect(origin: CGPointZero,size: image!.size))
        
        
        currentImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        imageView.image = currentImage
        
        
    }
    
    
    
    @IBAction func fivePpointedStarButtonClick(sender: UIButton) {
        var currentImage :UIImage
        UIGraphicsBeginImageContextWithOptions(image!.size, false, 0)
        
        let startPointAngle:CGFloat = -90
        let pointCount = 6
        let meanAngle:CGFloat = 360.0/CGFloat(pointCount)
        let path = UIBezierPath()
        for i in 0...pointCount{
            let pointAngle = meanAngle * CGFloat(i)-startPointAngle
            let point = calcCircleCoordinate(CGPoint(x:image!.size.width/2, y: image!.size.width/2), angle: pointAngle, radius: image!.size.width/2)
            print("\(pointAngle)--\(point)")
            if i == 0 {
                path.moveToPoint(point)
            }else{
                path.addLineToPoint(point)
            }
        }
        
        path.addClip()
        
        image!.drawInRect(CGRect(origin: CGPointZero,size: image!.size))
        
        
        currentImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        imageView.image = currentImage

        
        
        
        
    }
    
    func calcCircleCoordinate(center:CGPoint,angle:CGFloat,radius:CGFloat) -> CGPoint{
        
        let x2 = radius * CGFloat(cosf(Float(angle)*Float(M_PI)/Float(180)))
        let y2 = radius * CGFloat(sinf(Float(angle)*Float(M_PI)/Float(180)))
        return CGPoint(x: center.x+x2, y: center.y-y2);
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = image
        
        view.backgroundColor = UIColor.grayColor()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

