//
//  Elevator.swift
//  ElevatorSimIOS
//
//  Created by Ryan Schoenlein on 4/2/20.
//  Copyright © 2020 Ryan Schoenlein. All rights reserved.
//

import Foundation
import UIKit

class Elevator: UIView {
    
    //MARK: Properties
    var width = 0
    var height = 0
    var x = 0
    var y = 0
    var door: Door
    var currentFloor = 1
    var direction = "up"
    
    override init(frame: CGRect) {
        width = Int(frame.width)
        height = Int(frame.height)
        x = Int(frame.origin.x)
        y = Int(frame.origin.y)
        door = Door(frame: frame, x: x + 40, y: y + 40)
        
        print("Created elevator at: ", x, ", ", y)
        print("Created door at: ", self.door.x, ", ", self.door.y)
        
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Actions
    override func draw(_ rect: CGRect)
    {
        drawDoor()
    }
    
    func drawDoor() {
        door.draw(CGRect(
            origin: CGPoint(x: door.x, y: door.y),
            size: CGSize(width: door.width, height: door.height)));
    }
    
    func moveDown() {
        UIView.animate(withDuration: 0.3) {
            self.frame.origin.y += 50
        }
    }
    
    func moveUp(spacing: Int) {
        //TODO entering this scope but not adjusting self.y
        UIView.animate(withDuration: 1.0,
                       delay: 0.0,
                       options: [],
                       animations: {
                        self.frame.origin.y += CGFloat(spacing)
        },
                       completion: nil)
    }
}
