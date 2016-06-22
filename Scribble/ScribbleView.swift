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
    
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        let ctx = UIGraphicsGetCurrentContext()
        
        strokes.forEach { (stroke:Stroke) in
            if (stroke.points.count > 1) {
                let h = stroke.points.first!
                CGContextMoveToPoint(ctx, h.x, h.y)
                let count = stroke.points.count
                let tail = stroke.points[1..<count]
                tail.forEach({ (p:CGPoint) in
                    CGContextAddLineToPoint(ctx, p.x, p.y)
                })
                
                CGContextSetLineWidth(ctx, 4.0)
                CGContextSetLineCap(ctx, CGLineCap.Round)
                CGContextStrokePath(ctx)
            }
        }
        
    }

}
