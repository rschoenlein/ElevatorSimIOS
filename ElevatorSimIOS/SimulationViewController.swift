//
//  SImulationViewController.swift
//  ElevatorSimIOS
//
//  Created by Ryan Schoenlein on 3/21/20.
//  Copyright © 2020 Ryan Schoenlein. All rights reserved.
//

import UIKit


//TODO make this adaptive
class SimulationViewController: UIViewController, SimulationDelegate {
    
    //MARK: Properties
    var numElevators:Int? = 0
    var elevators: [Elevator] = []
    var delegate:SimulationDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //populate array of elevators
        //TODO
        print("creating this many elevators: ", self.numElevators!)
        
        for i in 1...3 {
            let elevator = Elevator(frame: CGRect(x: 80 + (50 * i), y: 90, width: 50, height: 50))
            self.elevators.append(elevator)
        }
        
        
        //draw elevators
        for elevator in self.elevators {
            elevator.draw(CGRect(
                origin: CGPoint(x: elevator.x, y: elevator.y),
                size: CGSize(width: elevator.width, height: elevator.height)));
            
            // Add the view to the view hierarchy so that it shows up on screen
            self.view.addSubview(elevator)
        }
    }

    //MARK: Actions
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //required implementation from SimulationDelegate
    func setNumElevators(num: String) {
        self.numElevators = Int(num)
    }
}

//used to send data back and forth from menu view
protocol SimulationDelegate
{
    func setNumElevators(num: String)
}

class Elevator: UIView {
    
    //MARK: Properties
    var width = 0
    var height = 0
    var x = 0
    var y = 0
    
    override init(frame: CGRect) {
        width = Int(frame.width)
        height = Int(frame.height)
        x = Int(frame.origin.x)
        y = Int(frame.origin.y)
        
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Actions
    override func draw(_ rect: CGRect)
    {
        let color:UIColor = UIColor.yellow
        
        let drect = CGRect(x: (Double(width) * 0.25), y: (Double(height) * 0.25), width: (Double(width) * 0.5), height: (Double(height) * 0.5))
        let bpath:UIBezierPath = UIBezierPath(rect: drect)
        
        color.set()
        bpath.stroke()
    }
}

//class ElevatorController {
//
//}
//
//class Door {
//
//}
//
//class Button {
//
//}
//
//class FloorButton: UIView {
//
//}
//
//class ElevatorButton: UIView {
//
//}
