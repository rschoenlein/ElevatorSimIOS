//
//  Door.swift
//  ElevatorSimIOS
//
//  Created by Ryan Schoenlein on 4/2/20.
//  Copyright © 2020 Ryan Schoenlein. All rights reserved.
//

import Foundation
import UIKit

class Door: UIView {
    
    //MARK: Properties
    //MARK: Properties
    var width = 0
    var height = 0
    var x = 0
    var y = 0
    var closed = true
    
    //MARK: Actions
    
    override init(frame: CGRect) {
        width = Int(frame.width)/2
        height = Int(frame.height)/2
        x = Int(frame.origin.x)
        y = Int(frame.origin.y)
        
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect)
    {
        let color:UIColor = UIColor.white
        
        let drect = CGRect(x: (Double(self.width) * 0.25), y: (Double(self.height) * 0.25), width: (Double(self.width) * 0.5), height: (Double(self.height) * 0.5))
        let bpath:UIBezierPath = UIBezierPath(rect: drect)
        
        color.set()
        bpath.stroke()
    }
    
    func open() {
        
    }
    
    func close() {
        
    }
}
