//
//  PaletteViewController.swift
//  Scribble
//
//  Created by Tomek on 25.06.2016.
//  Copyright © 2016 Bottega. All rights reserved.
//

import UIKit

class PaletteViewController: UIViewController {

    @IBAction func sizeSliderChanged(sender: UISlider) {
        let value = sender.value
        sliderSizeLabel.text = "\(round(value)) points"
    }
    
    @IBOutlet var sliderSizeLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
