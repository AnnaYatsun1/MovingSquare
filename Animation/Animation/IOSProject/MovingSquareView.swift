//
//  View.swift
//  Animation
//
//  Created by Anna Yatsun on 24/12/2018.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class MovingSquareView: UIView	{
    
    private var squarePosition = Position.topLeft
    private var corners = [Position : CGPoint]()
    
    @IBOutlet var buttonStartStop: UIButton!
    @IBOutlet var labelSquad: UILabel!
    var isAnimating = false
    var isStopped = true
    var squrePosition = Position.topLeft
    
    let trajectory = SequenceGenerator(Position.topLeft, .topRight, .bottomRight, .bottomLeft)
    
    override func draw(_ rect: CGRect) {
        self.buttonStartStop.backgroundColor = UIColor.green
        let bounds = self.bounds
        let upperLeftCorner = bounds.origin   // MAArk x 0 y 0  
        let lowerLeftCorner = CGPoint(x: 0 , y: bounds.height - self.labelSquad.frame.height)  // MArk x = 0.0  y = heigth - size of my lable
        let lowerWritCorner = CGPoint(x: bounds.width - self.labelSquad.frame.width , y: bounds.height - self.labelSquad.frame.height) // MAASk x = 
        let upperWriteCorner = CGPoint(x: bounds.width - self.labelSquad.frame.width, y: 0)  // Mark x = width y = 0
        
        self.corners[.bottomLeft] = lowerLeftCorner
        self.corners[.topRight] = upperWriteCorner
        self.corners[.topLeft] = upperLeftCorner
        self.corners[.bottomRight] = lowerWritCorner
    }
    
    func setSquarePosition(position: Position) {
        self.setSquarePosition(position: position, animated: false)
    }
    
    func setSquarePosition(position: Position, animated: Bool) {
        self.setSquarePosition(position: position, animated: animated, completionHandler: nil)
    }

    func setSquarePosition(
        position: Position,
        animated: Bool,
        completionHandler: ((Bool) -> ())?
    ) {
        if !self.isAnimating {
            self.isAnimating = true
            UIView.animate(
                withDuration: animated ? 2 : 0,
                animations: {
                    //  position to CGPoint
                    let nextOrigin = self.corners[position] ?? CGPoint.zero
                    print("nextOrigin \(nextOrigin)")
                    self.labelSquad.frame.origin = nextOrigin
                },
                completion: { finished in
                    self.isAnimating = false
                    if finished {
                        self.squarePosition = position
                        completionHandler?(finished)
                    }
                }
            )
        }
    }
    
    func loopingMovingOfSquare() {
        if !self.isStopped {
            self.buttonStartStop.backgroundColor = UIColor.red
            let nextPosition = self.trajectory.next()
            self.setSquarePosition(position: nextPosition, animated: true) { _ in
                self.loopingMovingOfSquare()
            } 
        } else {
            self.buttonStartStop.backgroundColor = UIColor.green
        }
    }
}

