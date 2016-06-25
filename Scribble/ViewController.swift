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
    
    let scribble = Scribble()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scribbleView.mark = scribble.rootStroke
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func newTapped(sender: AnyObject) {
        scribble.reset()
        scribbleView.mark = scribble.rootStroke
        scribbleView.setNeedsDisplay()
    }
    

    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let loc = touches.first?.locationInView(scribbleView) {
            print("TOUCH \(loc)")
            scribble.beginMark(loc)
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let loc = touches.first?.locationInView(scribbleView) {
            print("LINE \(loc)")
            scribble.appendToCurrentMark(Vertex(location: loc))
            scribbleView.setNeedsDisplay()
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let loc = touches.first?.locationInView(scribbleView) {
            print("END \(loc)")
            scribble.finishMark(loc)
        }
        scribbleView.setNeedsDisplay()
        
    }

    
}

