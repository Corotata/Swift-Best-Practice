//
//  ViewController.swift
//  4.CustomPlantProgress
//
//  Created by Corotata on 16/5/25.
//  Copyright © 2016年 corotata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let planeProgress = CustomPlantProgress(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
    
        planeProgress.startAnimal()
        view.addSubview(planeProgress)
        planeProgress.startAnimal()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

