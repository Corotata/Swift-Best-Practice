//
//  ViewController.swift
//  Music
//
//  Created by Corotata on 16/6/2.
//  Copyright © 2016年 corotata. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    lazy var lrcArray :NSMutableArray = {
        
        let lrcPath = NSBundle.mainBundle().pathForResource("10736444.lrc", ofType: nil)
        let lrcArray = NSMutableArray();
        do{
            let lrcStr = try NSString(contentsOfFile: lrcPath!, encoding: NSUTF8StringEncoding)
            for str in lrcStr.componentsSeparatedByString("\n"){
                if(str.hasPrefix("[ti:") || str.hasPrefix("[ar:") || str.hasPrefix("[al:") || !str.hasPrefix("[")){
                    continue
                }
                lrcArray.addObject(MusicLine(lrcLineStr: str))
            }
        }catch{
            
        }
        return lrcArray
    }()
    
    lazy var currentPlayer :AVAudioPlayer = {
        let path = NSBundle.mainBundle().pathForResource("10736444.mp3", ofType: nil)
        let url = NSURL(fileURLWithPath: path!)
        let player = try! AVAudioPlayer(contentsOfURL: url)
        player.prepareToPlay()
        return player
    }()
    
    var timer : CADisplayLink?
    
    var currentIndex: Int = 0
    
    var currentLineProgress: CGFloat = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.lrcArray)
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func play(sender: UIButton) {
        currentPlayer.play()
        addTimer()
    }

    
    @IBAction func pause(sender: UIButton) {
        currentPlayer.stop()
        removeTimer()
    }
 
    
    func addTimer(){
        timer = CADisplayLink(target: self, selector: #selector(ViewController.refreshLrc))
        timer?.addToRunLoop(NSRunLoop.mainRunLoop(), forMode:NSRunLoopCommonModes)
    }
    
    func removeTimer(){
        timer?.invalidate()
        timer = nil
    }
    
    func refreshLrc(){
       
        let currentTime = currentPlayer.currentTime
        for index in 0..<lrcArray.count{
            let currentLrcLine = lrcArray[index] as! MusicLine
            var nextlrcLine: MusicLine?
            
            if index < lrcArray.count - 1 {
                nextlrcLine = lrcArray[index + 1] as? MusicLine
            }
            
            if(currentIndex != index && currentTime >= currentLrcLine.time && currentTime < nextlrcLine?.time){
                let indexPath = NSIndexPath(forRow: index, inSection: 0)
                let previousIndexPath = NSIndexPath(forRow: currentIndex, inSection: 0)
                
                //记录当前行
                currentIndex = index
                tableView.reloadRowsAtIndexPaths([indexPath,previousIndexPath], withRowAnimation: .None)
                tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: .Middle, animated: false)
            }
            
            if currentIndex == index {
                let indexPath = NSIndexPath(forRow: currentIndex, inSection: 0)
                let value = (currentTime - currentLrcLine.time!)/(nextlrcLine!.time! - currentLrcLine.time!)
                currentLineProgress = CGFloat(value)
                tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .None)
                
            }
            
        }
        
        
        
    
    }
    
    
}

extension ViewController : UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lrcArray.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let ID = "CellID"
        var cell = tableView.dequeueReusableCellWithIdentifier(ID) as? CustomCell
        if cell == nil {
            cell = CustomCell(style: .Default, reuseIdentifier: ID)
        }
        
        let musicLine = lrcArray[indexPath.row] as! MusicLine
        cell?.lrcLabel?.text = musicLine.text
        
        
        if indexPath.row == currentIndex{
            cell!.lrcLabel!.font = UIFont.systemFontOfSize(16)
            cell!.lrcLabel!.progress = currentLineProgress;
        }else{
            cell!.lrcLabel!.font = UIFont.systemFontOfSize(14)
            cell!.lrcLabel!.progress = 0;
        }

        
        
        
        return cell!
        
        
        
    }
    
    
    
    
}