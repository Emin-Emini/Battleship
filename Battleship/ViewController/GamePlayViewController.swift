//
//  GamePlayViewController.swift
//  Battleship
//
//  Created by Emin Emini on 15.10.19.
//  Copyright © 2019 Emin Emini. All rights reserved.
//

import UIKit

class GamePlayViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var playerIndicatorLabel: UILabel!
    
    
    @IBOutlet var firstCollection: [UIButton]!
    
    //MARK: - DidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        /*
         The code below:
         Checks which player is playing (Player 1 or Player 2) then it determines which board to show
         */
        firstPlayerIsPlaying ? loadPlayerViewSetup(model: appDelegate.player2Model) : loadPlayerViewSetup(model: appDelegate.player1Model)
        playerIndicatorLabel.text = firstPlayerIsPlaying ?
            "Player 1's Turn" : "Player 2's Turn"
    }
    

    //MARK: - Functions
    func loadPlayerViewSetup(model: BattleshipModel) {
        for i in 0...119{
            let state = model.cellArray[i]
            //print("i = ", i, state)
            
            for cell in self.firstCollection{
                
                if cell.tag == i {
                    cell.titleLabel!.font = UIFont(name: "HelveticaNeue-Thin", size: 8)
                    //print(cell.tag,i)
                    
                    switch state{
                    case BattleshipModel.cellStatus.empty:
                        cell.backgroundColor = UIColor(red:0.09, green:0.47, blue:0.89, alpha:1.0)
                    case BattleshipModel.cellStatus.hit:
                        cell.setTitleColor(UIColor.white, for: .normal)
                        cell.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
                        cell.setTitle("HIT", for: .normal)
                        cell.backgroundColor = UIColor.red
                        cell.isEnabled = false
                    case BattleshipModel.cellStatus.miss:
                        cell.setTitleColor(UIColor.white, for: .normal)
                        cell.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
                        cell.setTitle("MISS", for: .normal)
                        cell.backgroundColor = UIColor(red:0.60, green:0.60, blue:0.60, alpha:1.0)
                        cell.isEnabled = false
                    case BattleshipModel.cellStatus.sunk:
                        cell.setTitleColor(UIColor.white, for: .normal)
                        cell.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
                        cell.setTitle("SUNK", for: .normal)
                        cell.backgroundColor = UIColor.black
                        cell.isEnabled = false
                    default:
                        print("did not match any states")
                    }
                }
            }
        }
        

    }
    
    
    
    func youWin(){
        let player1win = UIAlertController(title: "🎉\nHurrayy!", message: "Player 1 won!", preferredStyle: UIAlertController.Style.alert);
        let player2win = UIAlertController(title: "🎉\nHurrayy!", message: "Player 2 won!", preferredStyle: UIAlertController.Style.alert);
        
        let alert = firstPlayerIsPlaying ? player1win : player2win
        //show it
        
        //no event handler (just close dialog box)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: { (action: UIAlertAction!) in
            appDelegate.loadModels()
            firstPlayerIsPlaying = true
            self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        }));
        
        show(alert, sender: self);
    }
    
    
    //passing information thru segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    
    //MARK: - Actions
    @IBAction func cellClicked(_ sender: UIButton) {
        
        for cell in firstCollection {
            cell.isEnabled = false;
        }
        
        //print(appDelegate.player2Model.checkAllSunk())
        
        
        if firstPlayerIsPlaying {
            appDelegate.player2Model.hitCell(cellIndex: sender.tag)
            if appDelegate.player2Model.checkAllSunk() {
                print("player 1 wins")
                youWin()
            }
            loadPlayerViewSetup(model: appDelegate.player2Model)
            print("Player 1 is playing -> Load Player's 2 Field")
        } else {
            appDelegate.player1Model.hitCell(cellIndex: sender.tag)
            if appDelegate.player1Model.checkAllSunk() {
                print("player 2 wins")
                youWin()
            }
            loadPlayerViewSetup(model: appDelegate.player1Model)
            print("Player 2 is playing -> Load Player's 1 Field")
        }
          
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
            for cell in self.firstCollection{
                cell.isEnabled = true;
            }
            self.performSegue(withIdentifier: "goToNextPlayer", sender: self)
        }
        
    }
    
    

}
