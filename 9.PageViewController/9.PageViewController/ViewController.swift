//
//  ViewController.swift
//  9.PageViewController
//
//  Created by Corotata on 16/6/3.
//  Copyright © 2016年 corotata. All rights reserved.
//

import UIKit

class ViewController: UIPageViewController {

    lazy var dataArray : NSArray = {
        let array = ["0","1","2","3"]
        return array
    
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setViewControllers([setupDetailViewControllerForName(dataArray[0] as! String)], direction: .Forward, animated: false, completion: nil)
        dataSource = self
        
    }

}

func setupDetailViewControllerForName(name: String) -> DetailViewController{
    let detailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("detailViewController") as! DetailViewController
    detailViewController.view.backgroundColor = UIColor.redColor()
    detailViewController.backgroundImageView.image = UIImage(named: name)
    detailViewController.pageNum = (name as NSString).integerValue
    return detailViewController
}

extension ViewController: UIPageViewControllerDataSource{
    
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let controller = viewController as! DetailViewController
        if controller.pageNum < dataArray.count - 1 {
            return setupDetailViewControllerForName(dataArray[controller.pageNum+1] as! String)
        }
        return nil
          
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let controller = viewController as! DetailViewController
        if controller.pageNum > 0 {
            return setupDetailViewControllerForName(dataArray[controller.pageNum - 1] as! String)
        }
        return nil
    }
}




