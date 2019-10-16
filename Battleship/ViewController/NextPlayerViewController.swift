//
//  NextPlayerViewController.swift
//  Battleship
//
//  Created by Emin Emini on 15.10.19.
//  Copyright © 2019 Emin Emini. All rights reserved.
//

import UIKit

class NextPlayerViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var messageIcon: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    //MARK: - View DidLoad & WillAppear
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let message = "Hand the phone to\n"
        messageLabel.text = firstPlayerIsPlaying ? isComputer ? "Computer is next!" : "\(message) Player 2" : "\(message) Player 1"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        messageIcon.shake()
    }

    
    //MARK: - Actions
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
