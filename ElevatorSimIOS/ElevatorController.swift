//
//  ElevatorController.swift
//  ElevatorSimIOS
//
//  Created by Ryan Schoenlein on 4/2/20.
//  Copyright © 2020 Ryan Schoenlein. All rights reserved.
//

import Foundation
import UIKit

//TODO make this adaptive
class ElevatorController: UIViewController {
    
    //MARK: Properties
    var numElevators:Int = 0
    var spacing:Int = 0
    var elevators: [Elevator] = []
    var floorRequests: [Int] = []
    
    //MARK: Actions
    init(numElevators: Int, spacing: Int) {
        super.init(nibName: nil, bundle: nil)
        
        self.numElevators = numElevators
        self.spacing = spacing
        self.setUpElevators()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpElevators() {
        let limit = Int(self.numElevators)
        
        for i in 1...limit {
            let elevator = Elevator(frame: CGRect(x: 50 + (self.spacing * i) - self.spacing/2, y: 90, width: self.spacing - 20, height: 50), floor: self.numElevators)
            self.elevators.append(elevator)
        }
    }
    
    func moveElevators() {
        for elevator in self.elevators {
           elevator.move()
        }
        
        //TODO accept calls from floor buttons, send available elevator, change elevator status, move elevator
        //update all elevator statuses
    }
    
    func serveElevator(floor: Int) -> Elevator? {
        for elevator in self.elevators {
            elevator.updateDirection()
            if(elevator.status() == "idle") {
                print("elevator served for floor: ", elevator.destination)
                return elevator
            }
        }
        
        return nil
    }
}
