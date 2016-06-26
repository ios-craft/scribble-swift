//
//  Scribble.swift
//  Scribble
//
//  Created by Tomek on 25.06.2016.
//  Copyright © 2016 Bottega. All rights reserved.
//

import Foundation
import UIKit

class Scribble {
    
    var rootStroke:Stroke = Stroke()
    var currentStroke:Stroke?
    
    func reset() {
        rootStroke = Stroke()
    }
    
    func beginMark(location: CGPoint, size: Float) {
        let stroke = Stroke(location:location, size:size)
        currentStroke = stroke
        rootStroke.addChild(stroke)
    }
    
    func appendToCurrentMark(mark: Mark) {
        currentStroke?.addChild(mark)
    }
    
    func finishMark(location: CGPoint) {
        guard let currentStroke = currentStroke else { return }
        if currentStroke.isEmpty() {
            currentStroke.addChild(Dot(location: location, size: currentStroke.size))
        }
    }
    
}