//
//  ViewController.swift
//  Scribble
//
//  Created by Tomek on 22.06.2016.
//  Copyright © 2016 Bottega. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PaletteMediatorDelegate {

    @IBOutlet var scribbleView: ScribbleView!
    
    let scribble = Scribble()
    var mediator:Mediator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scribbleView.mark = scribble.rootStroke
        mediator = Mediator(viewController: self)
        mediator?.delegate = self
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
    
    
    @IBAction func penTapped(sender: AnyObject) {
        mediator?.navigateToPalette()
    }

    func didSetPenSize(newSize: Float) {
        NSLog("Pen size set to \(newSize)")
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

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        mediator?.prepareForSegue(segue)
    }
    
}

