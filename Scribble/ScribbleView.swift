//
//  ScribbleView.swift
//  Scribble
//
//  Created by Tomek on 22.06.2016.
//  Copyright © 2016 Bottega. All rights reserved.
//

import UIKit

class ScribbleView: UIView {

    var strokes:[Stroke] = [ Stroke(points:[CGPoint(x: 10,y: 10), CGPoint(x: 100,y: 100)]) ]
    
    var currentStroke:[CGPoint] = []
    
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        let ctx = UIGraphicsGetCurrentContext()
        
        strokes = [Stroke(points:currentStroke)]
        
        strokes.forEach { (stroke:Stroke) in
            if (stroke.points.count > 1) {
                let h = stroke.points.first!
                CGContextMoveToPoint(ctx, h.x, h.y)
                let tail = stroke.points.dropFirst()
                tail.forEach({ (p:CGPoint) in
                    CGContextAddLineToPoint(ctx, p.x, p.y)
                })
                
                CGContextSetLineWidth(ctx, 4.0)
                CGContextSetLineCap(ctx, CGLineCap.Round)
                CGContextStrokePath(ctx)
            } else {
                if let loc = stroke.points.first {
                    let frame = CGRect(origin: loc, size: CGSize(width: 4.0, height: 4.0))
                    CGContextSetFillColorWithColor(ctx, UIColor.blackColor().CGColor)
                    CGContextFillEllipseInRect(ctx, frame)
                }
            }
        }
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let loc = touches.first?.locationInView(self) {
            print("TOUCH \(loc)")
            
            currentStroke = [CGPoint]()
            currentStroke.append(loc)
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let loc = touches.first?.locationInView(self) {
            print("LINE \(loc)")
            currentStroke.append(loc)
            self.setNeedsDisplay()
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let loc = touches.first?.locationInView(self) {
            print("END \(loc)")
        }
        self.setNeedsDisplay()
    }


}
