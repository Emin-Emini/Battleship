//
//  BattleshipModel.swift
//  Battleship
//
//  Created by Emin Emini on 15.10.19.
//  Copyright © 2019 Emin Emini. All rights reserved.
//

import Foundation

class BattleshipModel{
    
    var cellArray = [cellStatus]()
    
    var ship2 = [Int]()
    var ship3 = [Int]()
    var ship33 = [Int]()
    var ship4 = [Int]()
    var ship5 = [Int]()
    
    var allShipIndex = [Int]()

    
    enum cellStatus{
        case empty
        case hit
        case miss
        case sunk
        case shipEmpty
        
    }
    
    init(){
    
        //initialize all cells to empty first
        for i in 0...119{
            cellArray.append(cellStatus.empty)
            //print("model cell ", i, cellArray[i] )
        }
 
    }
    
    
    func checkAllSunk() -> Bool{
        
        let ship2Sank = checkSunk(ship: ship2)
        let ship3Sank = checkSunk(ship: ship3)
        let ship33Sank = checkSunk(ship: ship33)
        let ship4Sank = checkSunk(ship: ship4)
        let ship5Sank = checkSunk(ship: ship5)
        
        
        if ship2Sank && ship3Sank && ship33Sank && ship4Sank && ship5Sank{
            return true
        }
        return false
        
        
    }
    
    func checkSunk(ship: [Int] ) -> Bool{
        for cellIndex in ship{
            if cellArray[cellIndex] != cellStatus.hit && cellArray[cellIndex] != cellStatus.sunk{
                return false
            }
            
        }
        
        for cellIndex in ship{
            cellArray[cellIndex] = cellStatus.sunk
        }
        return true;
        
    }
    
    
    
    func hitCell(cellIndex : Int){
        if allShipIndex.contains(cellIndex){
            cellArray[cellIndex] = cellStatus.hit
        }
        else{
            cellArray[cellIndex] = cellStatus.miss
        }
    }
    
    
    
   
}
