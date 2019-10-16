//
//  AppDelegate.swift
//  Battleship
//
//  Created by Emin Emini on 15.10.19.
//  Copyright © 2019 Emin Emini. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var player1Model = BattleshipModel()
    var player2Model =  BattleshipModel()
    
    
    var k = Int(arc4random_uniform(9))
    var indexRangeStart = 20
    var indexRangeEnd = 20

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        loadModels()
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
    func loadModels() {
        print("Loading models from AppDelegate")
        
        player1Model = BattleshipModel()
        player2Model =  BattleshipModel()
        
        var k = Int(arc4random_uniform(9))
        var indexRangeStart = 80 + k
        var indexRangeEnd = indexRangeStart + 11
        
        //MARK: - Player 1
        /* ------------------------- Player 1 Ships ----------------------------*/
        
        ship2(model: player1Model, index: 80)
        ship33(model: player1Model, index: 60)
        ship3(model: player1Model, index: 20)
        
        //ship4
        k = Int(arc4random_uniform(7))
        indexRangeStart = 0 + k
        indexRangeEnd = indexRangeStart + 3
        for i in indexRangeStart...indexRangeEnd{
            let ship4Index = i
            player1Model.ship4.append(ship4Index)
            player1Model.allShipIndex.append(ship4Index)
        }
        
        //ship5
        k = Int(arc4random_uniform(6))
        indexRangeStart = 110 + k
        indexRangeEnd = indexRangeStart + 4
        for i in indexRangeStart...indexRangeEnd{
            let ship5Index = i
            player1Model.ship5.append(ship5Index)
            player1Model.allShipIndex.append(ship5Index)
        }
        
        
        
        //MARK: - Player 2
        /* ------------------------- Player 2 Ships ----------------------------*/
        
        ship2(model: player2Model, index: 80)
        ship33(model: player2Model, index: 110)
        ship3(model: player2Model, index: 20)
        
        
        //ship4
        k = Int(arc4random_uniform(7))
        indexRangeStart = 0 + k
        indexRangeEnd = indexRangeStart + 3
        for i in indexRangeStart...indexRangeEnd{
            let ship4Index = i
            player2Model.ship4.append(ship4Index)
            player2Model.allShipIndex.append(ship4Index)
        }
        
        //ship5
        k = Int(arc4random_uniform(6))
        indexRangeStart = 60 + k
        indexRangeEnd = indexRangeStart + 4
        for i in indexRangeStart...indexRangeEnd{
            let ship5Index = i
            player2Model.ship5.append(ship5Index)
            player2Model.allShipIndex.append(ship5Index)
        }
        
        
        
    }
    
    
    //MARK: - Ships
    //Ship 2
    func ship2(model: BattleshipModel, index: Int) {
        let horizontal = Bool.random()
        
        if horizontal {
            //ship2 horizontal
            k = Int(arc4random_uniform(9))
            indexRangeStart = index + k
            indexRangeEnd = indexRangeStart + 1
            for i in indexRangeStart...indexRangeEnd{
                let ship2Index = i
                model.ship2.append(ship2Index)
                model.allShipIndex.append(ship2Index)
            }
        } else {
            //ship2 vertical
            k = Int(arc4random_uniform(9))
            indexRangeStart = index + k
            indexRangeEnd = indexRangeStart + 11
            for i in stride(from:indexRangeStart, to: indexRangeEnd, by: 10){
                let ship2Index = i
                
                //cellArray[ship3Index] = cellStatus.hit
                model.ship2.append(ship2Index)
                model.allShipIndex.append(ship2Index)
            }
        }
        
    }
    
    
    //Ship 33
    func ship33(model: BattleshipModel, index: Int) {
        k = Int(arc4random_uniform(8))
        indexRangeStart = index + k
        indexRangeEnd = indexRangeStart + 2
        for i in indexRangeStart...indexRangeEnd {
            let ship33Index = i;
        
            model.ship33.append(ship33Index)
            model.allShipIndex.append(ship33Index)
        }
        
    }
    
    
    //Ship 3
    func ship3(model: BattleshipModel, index: Int) {
        
        
        let horizontal = Bool.random()
        
        if horizontal {
            //ship3 horizontal
            k = Int(arc4random_uniform(7))
            indexRangeStart = 20 + k
            indexRangeEnd = indexRangeStart + 2
            for i in indexRangeStart...indexRangeEnd{
                let ship3Index = i;
                
                model.ship3.append(ship3Index)
                model.allShipIndex.append(ship3Index)
            }
        } else {
            //ship3 vertical
            k = Int(arc4random_uniform(9))
            indexRangeStart = index + k
            indexRangeEnd = indexRangeStart + 21
            for i in stride(from:indexRangeStart, to: indexRangeEnd, by: 10){
                let ship3Index = i
                
                //cellArray[ship3Index] = cellStatus.hit
                model.ship3.append(ship3Index)
                model.allShipIndex.append(ship3Index)
            }
        }
        
    }


}

