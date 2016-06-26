//
//  PaletteViewController.swift
//  Scribble
//
//  Created by Tomek on 25.06.2016.
//  Copyright © 2016 Bottega. All rights reserved.
//

import UIKit

protocol PaletteViewControllerDelegate: class {
    func penSizeChanged(size:Float)
}

class PaletteViewController: UIViewController {

    let colorArray = [ 0x000000, 0xfe0000, 0xff7900, 0xffb900, 0xffde00, 0xfcff00, 0xd2ff00, 0x05c000, 0x00c0a7, 0x0600ff, 0x6700bf, 0x9500c0, 0xbf0199, 0xffffff ]

    @IBAction func sizeSliderChanged(sender: UISlider) {
        let value = round(sender.value)
        sliderSizeLabel.text = "\(value) points"
        delegate?.penSizeChanged(value)
    }
    
    var penSize:Float = 4.0
    
    weak var delegate:PaletteViewControllerDelegate?
    
    @IBOutlet var sizeSlider: UISlider!
    
    @IBOutlet var sliderSizeLabel: UILabel!
    
    @IBOutlet var colorSampler: UIView!
    
    @IBAction func colorValueChanged(sender: UISlider) {

        let colorId = colorArray[Int(sender.value)]
        let color = uiColorFromHexValue(colorId)
        colorSampler.backgroundColor = color
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sizeSlider.value = penSize
        // Do any additional setup after loading the view.
    }
    
    @IBAction func doneTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func uiColorFromHexValue(rgbValue: Int) -> UIColor {
        
        let red =   CGFloat((rgbValue & 0xFF0000) >> 16) / 0xFF
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 0xFF
        let blue =  CGFloat(rgbValue & 0x0000FF) / 0xFF
        let alpha = CGFloat(1.0)
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
