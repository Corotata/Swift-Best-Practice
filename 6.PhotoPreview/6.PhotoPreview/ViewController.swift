//
//  ViewController.swift
//  6.PhotoPreview
//
//  Created by Corotata on 16/6/3.
//  Copyright © 2016年 corotata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var scrollView :UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.backgroundColor = UIColor.blackColor()
        return scrollView
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "city"))
        return imageView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.frame = view.bounds
        scrollView.autoresizingMask = [.FlexibleWidth,.FlexibleHeight]

        view.addSubview(scrollView)
        scrollView.addSubview(imageView)

    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateMinZoomScaleForSize(scrollView.frame.size)
        if scrollView.zoomScale < scrollView.minimumZoomScale {
            scrollView.zoomScale = scrollView.minimumZoomScale
        }
        
    }
    
    func updateMinZoomScaleForSize(scrollViewSize: CGSize){
        let imageSize = imageView.bounds.size
        let heightScale = scrollViewSize.height / imageSize.height
        let widthScale = scrollViewSize.width / imageSize.width
        
        let minZoomScale = min(heightScale, widthScale)
        
        scrollView.maximumZoomScale = 3.0
        scrollView.minimumZoomScale = minZoomScale
        scrollView.zoomScale = minZoomScale
        
    }
    
    func recenterImage(){
        let imageViewSize = imageView.frame.size
        let scrollViewSize = scrollView.bounds.size
        
        let horizontalSpace = (scrollViewSize.width > imageViewSize.width) ? (scrollViewSize.width - imageViewSize.width)/2 : 0
        let verticalSpace = (scrollViewSize.height > imageViewSize.height) ? (scrollViewSize.height - imageViewSize.height)/2 : 0
        scrollView.contentInset = UIEdgeInsets(top: verticalSpace, left: horizontalSpace, bottom: verticalSpace, right: horizontalSpace)
        print(scrollView.contentInset)
    }
    
}

extension ViewController:UIScrollViewDelegate {

    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
//        if scrollView.zoomScale <= scrollView.minimumZoomScale {
            recenterImage()
//        }
    }
}