//
//  NextPlayerViewController.swift
//  Battleship
//
//  Created by Emin Emini on 15.10.19.
//  Copyright © 2019 Emin Emini. All rights reserved.
//

import UIKit

class NextPlayerViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var okButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let message = "Hand the phone to\n"
        
        messageLabel.text = firstPlayerIsPlaying ? "\(message) Player 2" : "\(message) Player 1"
        
        okButton.clipsToBounds = true
        okButton.layer.cornerRadius = 20
    }

    @IBAction func passToNextPlayer(_ sender: Any) {
        if firstPlayerIsPlaying {
            firstPlayerIsPlaying = false
            print("firstPlayerIsPlaying -> \(firstPlayerIsPlaying)")
        } else {
            firstPlayerIsPlaying = true
            print("firstPlayerIsPlaying -> \(firstPlayerIsPlaying)")
        }
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
