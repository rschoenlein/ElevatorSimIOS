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
            let elevator = Elevator(frame: CGRect(x: 25 + (self.spacing * i), y: 90, width: self.spacing - 10, height: self.spacing))
            self.elevators.append(elevator)
        }
    }
    
    //TODO adjust this according to sequence diagram
    func moveElevators() {
        for elevator in self.elevators {
            if(elevator.frame.origin.y > 600) {
                elevator.direction = "up"
            }
            if(elevator.frame.origin.y < 100) {
                elevator.direction = "down"
            }
            if(elevator.direction == "up") {
                elevator.moveUp(spacing: self.spacing)
            }else if(elevator.direction == "down") {
                elevator.moveDown(spacing: self.spacing)
            }
        }
    }
}
