//
//  ViewController.swift
//  CustomControl
//
//  Created by Corotata on 16/5/12.
//  Copyright © 2016年 Sun. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var topViewHConstraint: NSLayoutConstraint!
    
    
    let headViewH :CGFloat = 200
    let infoDetailViewH :CGFloat = 70
    let margin :CGFloat = 10
    let workTimeInfoViewH :CGFloat = 75
    let languageViewH :CGFloat = 30

    let headViewMinH :CGFloat = 64
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        tableView.dataSource = self
        tableView.delegate = self
        
        let origralX = headViewH + infoDetailViewH + margin + workTimeInfoViewH + languageViewH
        tableView.contentInset = UIEdgeInsets(top: origralX, left: 0, bottom: 0, right: 0 )
        
        setupNavigationBar()
        
        // Do any additional setup after loading the view, typically from a nib.
    }



    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        //偏移量 = 当前位置 - 原始位置
        let originalY = -(headViewH + infoDetailViewH + margin + workTimeInfoViewH + languageViewH)
        let currentY = scrollView.contentOffset.y
        let offset = currentY - originalY
        
        var changeTopViewHeight = headViewH - offset
        if changeTopViewHeight < headViewMinH {
            changeTopViewHeight = headViewMinH
        }
        topViewHConstraint.constant = changeTopViewHeight
        
        var aplah = offset/(headViewH - headViewMinH)
        if aplah > 1{
            aplah = 0.99
        }
        
        print(aplah)
        
        let color = UIColor.coro_color(0x4a5caf,aAlpha: aplah)
        navigationController?.navigationBar.setBackgroundImage(UIImage.coro_image(color), forBarMetrics: UIBarMetrics.Default)
        
        
        
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        
        let leftButton = UIButton(type: UIButtonType.Custom)
        leftButton.setImage(UIImage(named: "settingBtn_normal"), forState: UIControlState.Normal)
        leftButton.setImage(UIImage(named: "settingBtn_highlighted"), forState: UIControlState.Highlighted)
        leftButton.frame.size = leftButton.currentImage!.size
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        
        let rightButton = UIButton(type: UIButtonType.Custom)
        rightButton.setImage(UIImage(named: "personal-center_normal"), forState: UIControlState.Normal)
        rightButton.setImage(UIImage(named: "personal-center_highlighted"), forState: UIControlState.Highlighted)
        rightButton.frame.size = rightButton.currentImage!.size
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
    }
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellID = "cell"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellID)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellID)
        }
        
        cell?.textLabel?.text = "\(indexPath.row)"
        
        return cell!
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    
//    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let label = UILabel()
//        label.font = UIFont.systemFontOfSize(15)
//        label.backgroundColor = UIColor.coro_color(0xf2f2f2)
//        label.text = "    语言"
//        return label
//    }

}

