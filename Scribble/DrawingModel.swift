//
//  DrawingModel.swift
//  Scribble
//
//  Created by Tomek on 22.06.2016.
//  Copyright © 2016 Bottega. All rights reserved.
//

import Foundation
import UIKit

protocol Mark {
    var location: CGPoint { get set }
    var children:[Mark] { get set }
    var size:Float { get set }

    // more to come later
    func draw(ctx:CGContext)
    

    
}

struct Vertex : Mark {
    var location: CGPoint
    var children:[Mark] = []
    var size:Float = 0
    
    init(location:CGPoint) {
        self.location = location
    }
    
    func draw(ctx:CGContext) {
        CGContextAddLineToPoint(ctx, location.x, location.y);
    }

}

struct Dot : Mark {
    var location: CGPoint
    var children:[Mark] = []
    var size:Float
    
    init(location:CGPoint, size:Float) {
        self.location = location
        self.size = size
    }    
    
    func draw(ctx:CGContext) {
        let frame = CGRect(origin: location, size: CGSize(width: CGFloat(size), height: CGFloat(size)))
        CGContextSetFillColorWithColor(ctx, UIColor.blackColor().CGColor)
        CGContextFillEllipseInRect(ctx, frame)
    }
}

class Stroke : Mark {
    var location: CGPoint = CGPointZero
    var children:[Mark] = []
    var size:Float = 1.0
    
    init(location:CGPoint, size:Float) {
        self.location = location
        self.size = size
    }
    
    init() {
        
    }
    
    func draw(context:CGContext) {
        CGContextMoveToPoint(context, self.location.x, self.location.y);
        children.forEach { (mark:Mark) in
            mark.draw(context)
        }
        CGContextSetStrokeColorWithColor(context,UIColor.blackColor().CGColor);
        CGContextSetLineWidth(context, CGFloat(size))
        CGContextSetLineCap(context, CGLineCap.Round)
        CGContextStrokePath(context);
    }
    
    func addChild(child:Mark) {
        children.append(child)
    }
    
    func isEmpty() -> Bool {
        return children.isEmpty
    }

}
