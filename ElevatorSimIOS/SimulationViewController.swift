//
//  SImulationViewController.swift
//  ElevatorSimIOS
//
//  Created by Ryan Schoenlein on 3/21/20.
//  Copyright © 2020 Ryan Schoenlein. All rights reserved.
//

import UIKit

//TODO make this adaptive
class SimulationViewController: UIViewController {
    
    //MARK: Properties
    var numElevators = ""
    var elevators: [Elevator] = []
    var floorButtons: [FloorButton] = []
    var spacing = 70
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //populate array of elevators
        print("creating this many elevators: ", self.numElevators)
        
        self.setUpElevators();
        self.drawElevators();
        
        self.setUpFloorButtons()
        self.drawFloorButtons()
    }

    //MARK: Actions
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUpElevators() {
        let limit = Int(self.numElevators)!
        
        for i in 1...limit {
            let elevator = Elevator(frame: CGRect(x: 25 + (self.spacing * i), y: 90, width: self.spacing, height: self.spacing))
            self.elevators.append(elevator)
        }
    }
    
    func drawElevators() {
        for elevator in self.elevators {
            elevator.draw(CGRect(
                origin: CGPoint(x: elevator.x, y: elevator.y),
                size: CGSize(width: elevator.width, height: elevator.height)));
            
            // Add the view to the view hierarchy so that it shows up on screen
            self.view.addSubview(elevator)
        }
    }
    
    func setUpFloorButtons() {
        let limit = Int(self.numElevators)!
        
        for i in 1...limit {
            let button = FloorButton(frame: CGRect(x: 20, y: 100 + (self.spacing * i), width: 30, height: 30))
            self.floorButtons.append(button)
        }
    }
    
    func drawFloorButtons() {
        for button in self.floorButtons {
            button.draw(CGRect(
                origin: CGPoint(x: button.x, y: button.y),
                size: CGSize(width: button.width, height: button.height)));
            
            // Add the view to the view hierarchy so that it shows up on screen
            self.view.addSubview(button)
        }
    }
}
