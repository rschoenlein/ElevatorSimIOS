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
    var elevatorController: ElevatorController?
    var floorButtons: [FloorButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        //TODO calculate spacing based on width of screen and number of elevators
        let bounds: CGRect = UIScreen.main.bounds
        let width:CGFloat = bounds.size.width
        let spacing = Int(width)/Int(self.numElevators)! - 5
        
        self.elevatorController = ElevatorController(numElevators: Int(self.numElevators)!, spacing: spacing)
        
        self.elevatorController?.setUpElevators();
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
    
    func setUpFloorButtons() {
        let limit = Int(self.numElevators)!
        
        for i in 1...limit {
            let button = FloorButton(floor: i, frame: CGRect(x: 20, y: 100 + (self.elevatorController!.spacing * i), width: 30, height: 30))
            
            self.floorButtons.append(button)
        }
    }
    
    func serveFloorButtons() {
        for button in self.floorButtons {
            if(button.status == "waiting") {
                print("button waiting at floor: ", button.floorNum)
                self.elevatorController?.serveElevator(floor: button.floorNum)!.move()
            }
        }
    }
    
    func updateFloorButtons() {
        //TODO update floorbutton status's if their elevator has arrived
    }
    
    func drawFloorButtons() {
        for button in self.floorButtons {
            button.draw(CGRect(
                origin: CGPoint(x: button.x, y: button.y),
                size: CGSize(width: button.width, height: button.height)));
            
            // Add the view to the view hierarchy so that it shows up on screen
            self.view.addSubview(button)
        }
        
        self.serveFloorButtons()
    }
    
    func drawElevators() {
        for elevator in self.elevatorController!.elevators {
            elevator.draw(CGRect(
                origin: CGPoint(x: elevator.x, y: elevator.y),
                size: CGSize(width: elevator.width, height: elevator.height)));
            
            // Add the view to the view hierarchy so that it shows up on screen
            self.view.addSubview(elevator)
        }
    }
}

