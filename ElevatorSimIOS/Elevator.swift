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
    
    override init(frame: CGRect) {
        width = Int(frame.width)
        height = Int(frame.height)
        x = Int(frame.origin.x)
        y = Int(frame.origin.y)
        door = Door(frame: frame)
        
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
        
        drawDoor()
    }
    
    func drawDoor() {
        door.draw(CGRect(
            origin: CGPoint(x: door.x, y: door.y),
            size: CGSize(width: door.width, height: door.height)));
    }
}
