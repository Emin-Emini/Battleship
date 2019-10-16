//
//  MenuViewController.swift
//  Battleship
//
//  Created by Emin Emini on 16.10.19.
//  Copyright © 2019 Emin Emini. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var logoLabel: UILabel!
    @IBOutlet weak var pressPlayButtonLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var gameGuideButton: UIButton!
    
    
    //MARK: - Variables
    var animationFinished: Bool = false
    
    
    //MARK: - View DidLoad & DidAppear
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !animationFinished {
            viewAnimation()
        }
        animationFinished = true
    }
    
    
    //MARK: - Functions
    func viewAnimation() {
        self.logoImage.transform = CGAffineTransform.identity.scaledBy(x: 0, y: 0)
        self.logoLabel.alpha = 0
        self.pressPlayButtonLabel.alpha = 0
        self.playButton.alpha = 0
        self.gameGuideButton.alpha = 0
        
        UIView.animate(withDuration: 2.0, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
                self.logoImage.transform = CGAffineTransform.identity.scaledBy(x: 1, y: 1)
        }) { (finished) in
            UIView.animate(withDuration: 1, animations: {
                self.logoLabel.alpha = 1.0
                self.pressPlayButtonLabel.alpha = 1.0
                self.playButton.alpha = 1.0
                self.gameGuideButton.alpha = 1.0
                self.pressPlayButtonLabel.blink(enabled: true, duration: 1, delay: 0, stopAfter: 5)
            })
        }
    }
    
    func chooseGameMode() {
        let gameModeAlert = UIAlertController(title: "Choose Game Mode", message: "Choose game mode you want to play!", preferredStyle: UIAlertController.Style.alert)

        gameModeAlert.addAction(UIAlertAction(title: "P1 v P2", style: .default, handler: { (action: UIAlertAction!) in
            isComputer = false
            self.performSegue(withIdentifier: "playGame", sender: self)
        }))

        gameModeAlert.addAction(UIAlertAction(title: "P1 v COM", style: .default, handler: { (action: UIAlertAction!) in
            isComputer = true
            self.performSegue(withIdentifier: "playGame", sender: self)
        }))

        present(gameModeAlert, animated: true, completion: nil)
    }
    
    
    //MARK: - Actions
    @IBAction func playGame(_ sender: Any) {
        chooseGameMode()
    }
    
    

}
