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
        
        elevatorController = ElevatorController(numElevators: Int(self.numElevators)!, spacing: 90)
        
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
            let button = FloorButton(frame: CGRect(x: 20, y: 100 + (self.elevatorController!.spacing * i), width: 30, height: 30))
            
            //used to respond to touch events on floor buttons
            let gesture = UITapGestureRecognizer(target: self, action:  #selector (floorButtonTapHandler(sender:)))
            button.addGestureRecognizer(gesture)
            
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
    
    @objc func floorButtonTapHandler(sender : UITapGestureRecognizer) {
        print("floor button clicked...")
        self.elevatorController?.moveElevators()
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
