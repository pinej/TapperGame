//
//  ViewController.swift
//  Tapper Game
//
//  Created by Piotr Nejman on 25.12.2015.
//  Copyright © 2015 pinej. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //properties
    var maxTaps = 0
    var currentTaps = 0
    
    
    
    //Outlets
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var howManyTapsTxt: UITextField!
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var tapCoinBtn: UIButton!
    @IBOutlet weak var tapsLbl: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onCoinTapped(sender: UIButton!) {
        currentTaps++
        updateTaps()
        if isGameOver() {
            restartGame()
        }
        
    }
    
    @IBAction func onPlayButtonPressed(sender: UIButton!) {
        
        if howManyTapsTxt.text != nil && howManyTapsTxt.text != "" {
            logoImage.hidden = true
            howManyTapsTxt.hidden = true
            playBtn.hidden = true
            
            tapCoinBtn.hidden = false
            tapsLbl.hidden = false
            
            maxTaps = Int(howManyTapsTxt.text!)!
            currentTaps = 0
            updateTaps()
        }
    }
    
    func restartGame () {
        maxTaps = 0
        howManyTapsTxt.text = ""

        logoImage.hidden = false
        playBtn.hidden = false
        howManyTapsTxt.hidden = false
        
        tapCoinBtn.hidden = true
        tapsLbl.hidden = true
    }
    
    func isGameOver() -> Bool {
        if currentTaps >= maxTaps {
            return true
        } else {
            return false
        }
    }
    
    func updateTaps() {
        tapsLbl.text = "\(currentTaps) Taps"
 
    }
    
}

