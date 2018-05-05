//
//  ViewController.swift
//  BigOApp
//
//  Created by Martin Gamboa on 4/20/18.
//  Copyright © 2018 RenatoGamboa. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var menuOutlet: UIButton!
    @IBOutlet var selections: [UIButton]!
    
    @IBOutlet weak var videoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        
        
        
        
       
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handleSelection(_ sender: UIButton) {
        selections.forEach { (button) in
            UIView.animate(withDuration: 0.6, animations: {
                
               button.isHidden = !button.isHidden
                button.alpha = 1
                self.view.layoutIfNeeded()
            })
        }
    }
    
    enum Categories: String {
        case home = "Home"
        case dataStructures = "Data Structures"
        case sorting = "Sorting"
        case pseudocode = "Pseudocode"
    }
    
    @IBAction func selectionTapped(_ sender: UIButton) {
        
        menuOutlet.titleLabel?.text = sender.titleLabel?.text
        
        selections.forEach { (button) in
            UIView.animate(withDuration: 0.5, animations: {
                
                button.alpha = 0
                button.isHidden = !button.isHidden

                
                
                self.view.layoutIfNeeded()
            })
        }
        
        /*
        guard let title = sender.currentTitle, let category = Categories(rawValue: title) else{
            return
        }
        
        switch category {
        case .home:
            
            print("Home")
        default:
            print("Category")
        }
    
 */
    }
    
    private func setUpView() {
        let path = URL(fileURLWithPath: Bundle.main.path(forResource: "SpaceBackground1", ofType:"mp4")!)
        
        let player = AVPlayer.init(url: path)
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = view.layer.frame
        
        self.videoView.layer.addSublayer(playerLayer)
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        
        player.play()
        player.actionAtItemEnd = AVPlayerActionAtItemEnd.none
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.videoDidPlayToEnd(_:)), name: NSNotification.Name(rawValue: "AVPlayerItemDidPlayToEndTimeNotification"), object: player.currentItem)
    }
    
    @objc func videoDidPlayToEnd(_ notification: Notification) {
        let player: AVPlayerItem = notification.object as! AVPlayerItem
        player.seek(to: kCMTimeZero)
    }
    
    

}

