//
//  ViewController.swift
//  8.Paging Scroll Views
//
//  Created by Corotata on 16/6/3.
//  Copyright © 2016年 corotata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var scrollView: UIScrollView!
    
    lazy var dataArray : NSArray = {
        let array = ["1","2","3","4"]
        return array
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let view1 = setupDetailViewControllerForName("1").view
        let view2 = setupDetailViewControllerForName("2").view
        let view3 = setupDetailViewControllerForName("3").view
        let view4 = setupDetailViewControllerForName("4").view
        
        let dict = ["view":view,"view1":view1,"view2":view2,"view3":view3,"view4":view4]
        
        let format1 = "V:|[view1(==view)]|"
        let format2 = "H:|-10-[view1(==view)]-20-[view2(==view)]-20-[view3(==view)]-20-[view4(==view)]-10-|"
    
        
        let verticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat(format1, options: [], metrics: nil, views: dict)
        let horizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat(format2, options: [.AlignAllTop,.AlignAllBottom], metrics: nil, views: dict)
        NSLayoutConstraint.activateConstraints(verticalConstraints)
        NSLayoutConstraint.activateConstraints(horizontalConstraints)
        
        scrollView.contentSize = CGSize(width: (view.bounds.size.width) * 4, height: 0)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func setupDetailViewControllerForName(name: String) -> DetailViewController{
        let detailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("detailViewController") as! DetailViewController
       
        addChildViewController(detailViewController)
        scrollView.addSubview(detailViewController.view)
        detailViewController.didMoveToParentViewController(self)
        
        detailViewController.view.translatesAutoresizingMaskIntoConstraints = false
        detailViewController.backgroundImageView.image = UIImage(named: name)
        return detailViewController
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

