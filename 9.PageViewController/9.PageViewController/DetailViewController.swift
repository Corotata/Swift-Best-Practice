//
//  DetailViewController.swift
//  8.Paging Scroll Views
//
//  Created by Corotata on 16/6/3.
//  Copyright © 2016年 corotata. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var backgroundImageView: UIImageView!
//    var imageName :String?
    var pageNum : Int = 0
        {
        didSet{
            pageControl.currentPage = pageNum
        
        }
    }

}
