//
//  ViewController.swift
//  HW_2.2.
//
//  Created by Maxim Mitin on 10.07.21.
//

import UIKit

class ViewController: UIViewController {
    //view to change
    @IBOutlet weak var viewToChange: UIView!
    //labels
    @IBOutlet weak var redColorLabel: UILabel!
    @IBOutlet weak var greenColorLabel: UILabel!
    @IBOutlet weak var blueColorLabel: UILabel!
    //sliders
    @IBOutlet weak var redColorSlider: UISlider!
    @IBOutlet weak var greenColorSlider: UISlider!
    @IBOutlet weak var blueColorSlider: UISlider!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        redColorSlider.tintColor = .red
        greenColorSlider.tintColor = .green
        blueColorSlider.tintColor = .blue
        // default text to labels
        redColorLabel.text = "Red:\(redColorSlider.value)"
        greenColorLabel.text = "Green:\(redColorSlider.value)"
        blueColorLabel.text = "Blue:\(redColorSlider.value)"
    }
    
    @IBAction func slidersColorChanging() {
        //vars for usability
        var redValue = CGFloat(redColorSlider.value)
        var greenValue = CGFloat(greenColorSlider.value)
        var blueValue = CGFloat(blueColorSlider.value)
        //change text
        redColorLabel.text = "Red:\(redValue)"
        greenColorLabel.text = "Green:\(greenValue)"
        blueColorLabel.text = "Blue:\(blueValue)"
        //change color of view
        viewToChange.backgroundColor = UIColor(displayP3Red: redValue, green: greenValue, blue: blueValue, alpha: 1)
    }
}

