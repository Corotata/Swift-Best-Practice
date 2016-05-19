//
//  ViewController.swift
//  2.DownloadProgress
//
//  Created by Corotata on 16/5/16.
//  Copyright © 2016年 corotata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    

    @IBOutlet weak var downloadView: DownloadProgress!
    @IBOutlet weak var slider: UISlider!
    
    @IBAction func sliderChange(sender: UISlider) {
        downloadView.progress = (CGFloat)(sender.value / sender.maximumValue)
    
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.value = 0
        sliderChange(slider)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

