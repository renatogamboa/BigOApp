//
//  Data3.swift
//  BigOApp
//
//  Created by Martin Gamboa on 5/4/18.
//  Copyright © 2018 RenatoGamboa. All rights reserved.
//

import UIKit

class Data3: UIViewController {

    @IBOutlet weak var menuOutlet: UIButton!
    @IBOutlet var selections: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handleSelection(_ sender: UIButton) {
        selections.forEach { (button) in
            UIView.animate(withDuration: 0.3, animations: {
                
                button.isHidden = !button.isHidden
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
            UIView.animate(withDuration: 0.3, animations: {
                
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
    
    
}



