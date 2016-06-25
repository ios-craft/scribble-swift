//
//  ScribbleView.swift
//  Scribble
//
//  Created by Tomek on 22.06.2016.
//  Copyright © 2016 Bottega. All rights reserved.
//

import UIKit

class ScribbleView: UIView {

    var mark:Mark?
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        if let context = UIGraphicsGetCurrentContext() {
            mark?.draw(context)
        }
    }
    
}
