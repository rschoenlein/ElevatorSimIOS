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
    var destination = 0
    var door: Door
    var currentFloor = 1
    var direction = "idle"
    var elevatorButton: ElevatorButton
    
    //constructors
    override init(frame: CGRect) {
        self.width = Int(frame.width)
        self.height = Int(frame.height)
        self.x = Int(frame.origin.x)
        self.y = Int(frame.origin.y)
        self.door = Door(frame: frame, x: x + 40, y: y + 40)
        self.elevatorButton = ElevatorButton(frame: frame)
        
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(frame: CGRect, floor: Int) {
        self.init(frame: frame)
        self.currentFloor = floor
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
    
    func moveDown(spacing: Int) {
        UIView.animate(withDuration: 1.0,
                        delay: 0.0,
                        options: [],
                        animations: {
                        self.frame.origin.y += CGFloat(spacing)
        },
                        completion: nil)
    }
    
    func moveUp(spacing: Int) {
        UIView.animate(withDuration: 1.0,
                       delay: 0.0,
                       options: [],
                       animations: {
                        self.frame.origin.y -= CGFloat(spacing)
        },
                       completion: nil)
    }
    
    func move() {
        if(self.direction == "down") {
            self.moveDown(spacing: self.height)
        }
        
        if(self.direction == "up") {
            self.moveUp(spacing: self.height)
        }

    }
    
    func stop() {
        self.direction = "stopped"
    }
    
    func status() -> String {
        return self.direction
    }
    
    func updateDirection() {
        if(self.currentFloor > self.destination) {
            self.direction = "down"
        } else if (self.currentFloor < self.destination) {
            self.direction = "up"
        } else {
            self.direction = "idle"
        }
    }
}
