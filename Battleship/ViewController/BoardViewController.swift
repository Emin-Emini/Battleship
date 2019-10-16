//
//  ViewController.swift
//  Battleship
//
//  Created by Emin Emini on 15.10.19.
//  Copyright © 2019 Emin Emini. All rights reserved.
//

import UIKit

var firstPlayerIsPlaying: Bool = false
let appDelegate = UIApplication.shared.delegate as! AppDelegate

class BoardViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var playerIndicatorLabel: UILabel!
    
    @IBOutlet weak var firstCollectionView: UIView!
    @IBOutlet var firstCollection: [UIButton]!
    
    @IBOutlet weak var secondCollectionView: UIView!
    @IBOutlet var secondCollection: [UIButton]!
    
    
    //MARK: - DidLoad & WillAppear
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if firstPlayerIsPlaying {
            playerIndicatorLabel.text = "Player 1's Turn"
            firstCollectionView.isHidden = false
            secondCollectionView.isHidden = true
            loadViewSetup(model: appDelegate.player1Model, collection: firstCollection)
            print("load player 1 model")
        } else {
            playerIndicatorLabel.text = "Player 2's Turn"
            firstCollectionView.isHidden = true
            secondCollectionView.isHidden = false
            loadViewSetup(model: appDelegate.player2Model, collection: secondCollection)
            print("load player 2 model")
        }
    }
    
    //MARK: - Functions
    func loadViewSetup(model: BattleshipModel, collection: [UIButton]) {
        
        print("started loading model")
           
        for i in 0...119{
            //let state = player1Model.cellArray[i]
            let state = model.cellArray[i]
            //print("i = ", i, state)
            
            for cell in collection {
                
                if cell.tag == i {
                    cell.titleLabel!.font = UIFont(name: "HelveticaNeue-Thin", size: 8)
                    //print(cell.tag,i)
                    
                    switch state{
                    case BattleshipModel.cellStatus.empty
                    where model.allShipIndex.contains(i) :
                        cell.backgroundColor = UIColor.orange
                        //print(i)
                    case BattleshipModel.cellStatus.empty:
                        cell.backgroundColor = UIColor(red:0.09, green:0.47, blue:0.89, alpha:1.0)
                    //cell.setTitle("EMPTY", for: .normal)
                    case BattleshipModel.cellStatus.hit:
                        cell.setTitleColor(UIColor.white, for: .normal)
                        cell.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
                        cell.setTitle("HIT", for: .normal)
                        cell.backgroundColor = UIColor.red
                    case BattleshipModel.cellStatus.miss:
                        cell.setTitleColor(UIColor.white, for: .normal)
                        cell.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
                        cell.setTitle("MISS", for: .normal)
                        cell.backgroundColor = UIColor(red:0.60, green:0.60, blue:0.60, alpha:1.0)
                    case BattleshipModel.cellStatus.sunk:
                        cell.setTitleColor(UIColor.white, for: .normal)
                        cell.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
                        cell.setTitle("SUNK", for: .normal)
                        cell.backgroundColor = UIColor.black
                    default:
                        print("did not match any states")
                    }
                }
            }
        }
    }
    
    
    
    
    
    @IBAction func cancelGame(_ sender: Any) {
        let cancelGameAlert = UIAlertController(title: "Cancel Game", message: "Are you sure you want to cancel the game?", preferredStyle: UIAlertController.Style.alert)

        cancelGameAlert.addAction(UIAlertAction(title: "Cancel Game", style: .default, handler: { (action: UIAlertAction!) in
            self.dismiss(animated: true, completion: nil)
            appDelegate.loadModels()
            firstPlayerIsPlaying = true
        }))

        cancelGameAlert.addAction(UIAlertAction(title: "Continue Playing", style: .cancel, handler: { (action: UIAlertAction!) in
        }))

        present(cancelGameAlert, animated: true, completion: nil)
        
    }
    
    
    
}

