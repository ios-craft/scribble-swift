//
//  ViewController.swift
//  Scribble
//
//  Created by Tomek on 22.06.2016.
//  Copyright © 2016 Bottega. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var scribbleView: ScribbleView!
    
    var drawing:Stroke = Stroke()
    var currentStroke:Stroke = Stroke()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scribbleView.mark = drawing
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let loc = touches.first?.locationInView(scribbleView) {
            print("TOUCH \(loc)")
            currentStroke = Stroke(location:loc)
            drawing.addChild(currentStroke)
            
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let loc = touches.first?.locationInView(scribbleView) {
            print("LINE \(loc)")
            currentStroke.addChild(Vertex(location: loc))
            scribbleView.setNeedsDisplay()
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let loc = touches.first?.locationInView(scribbleView) {
            print("END \(loc)")
            if currentStroke.isEmpty() {
                currentStroke.addChild(Dot(location: loc))
            }
        }
        scribbleView.setNeedsDisplay()
        
    }

    
}

