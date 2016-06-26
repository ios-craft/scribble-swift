//
//  Mediator.swift
//  Scribble
//
//  Created by Tomek on 26.06.2016.
//  Copyright © 2016 Bottega. All rights reserved.
//

import Foundation
import UIKit

enum AppTransitions : String {
    case ShowPalette = "ShowPalette"    // copy-paste from .storyboard file; do it smarter
}

protocol PaletteMediatorDelegate: class {
    func didSetPenSize(newSize:Float)
}

class Mediator : PaletteViewControllerDelegate {

    var viewController:UIViewController
    weak var delegate:PaletteMediatorDelegate?
    
    init(viewController:UIViewController) {
        self.viewController = viewController
    }
    
    func prepareForSegue(segue: UIStoryboardSegue) {
        if let id = segue.identifier, transition = AppTransitions(rawValue: id) {
            switch transition {
            case .ShowPalette:
                showPalette(segue)
            }
        }
    }
    
    func showPalette(segue: UIStoryboardSegue) {
        if let vc = segue.destinationViewController as? PaletteViewController {
            vc.penSize = 4.0
            vc.delegate = self
        }
    }
    
    func navigateToPalette() {
        self.viewController.performSegueWithIdentifier(AppTransitions.ShowPalette.rawValue, sender: nil)
    }
    
    func penSizeChanged(size: Float) {
        delegate?.didSetPenSize(size)
    }

}

