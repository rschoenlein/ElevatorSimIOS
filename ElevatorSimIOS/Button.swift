//
//  Button.swift
//  ElevatorSimIOS
//
//  Created by Ryan Schoenlein on 4/2/20.
//  Copyright © 2020 Ryan Schoenlein. All rights reserved.
//

import Foundation
import UIKit

class Button: UIView {
    
    //MARK: Properties
    var width = 0
    var height = 0
    var x = 0
    var y = 0
    var illuminated = false
    
    //MARK: Actions
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
    
    override func draw(_ rect: CGRect)
    {
        if let context = UIGraphicsGetCurrentContext() {
            
            // Set the circle outerline-width
            context.setLineWidth(5.0);
            
            // Set the circle outerline-colour
            UIColor.blue.set()
            
            // Create Circle
            let center = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
            let radius = (frame.size.width - 10)/2
            context.addArc(center: center, radius: radius, startAngle: 0.0, endAngle: .pi * 2.0, clockwise: true)
            
            // Draw
            context.strokePath()
        }
    }
    
    func illuminate() {
        
    }
    
    func cancelIlluminate() {
        
    }
    
    func status() {
        
    }
}

class FloorButton: Button {
    
    //MARK: Properties
    var floorNum = 0
    let up = true
    
    //MARK: Actions
    init(floor: Int, frame: CGRect) {
        super.init(frame: frame)
        self.floorNum = floor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        //draw floor number
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        let attributes = [
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24.0),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        
        let myText = String(self.floorNum)
        let attributedString = NSAttributedString(string: myText, attributes: attributes)

        attributedString.draw(in: rect)
    }
}

class ElevatorButton: Button {
    
    //MARK: Properties
    let floorNum = 0
    
    //MARK: Actions
}
