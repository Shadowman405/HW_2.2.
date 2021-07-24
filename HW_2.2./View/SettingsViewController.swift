//
//  ViewController.swift
//  HW_2.2.
//
//  Created by Maxim Mitin on 10.07.21.
//

import UIKit

class SettingsViewController: UIViewController {
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
    //variables
    var colorForView: UIColor?  //var that changed color of small view via segue
    var delegate: MainScreenVCDelegate!  //delegate subscription

    override func viewDidLoad() {
        super.viewDidLoad()
        redColorSlider.tintColor = .red
        greenColorSlider.tintColor = .green
        blueColorSlider.tintColor = .blue
        
        viewToChange.backgroundColor = colorForView ?? .black
        
//MARK: - Hidding navigation controller elements
        navigationController?.setNavigationBarHidden(true, animated: false)
        navigationItem.setHidesBackButton(true, animated: false)
    }
    
    
    @IBAction func doneBtnClicked() {
        delegate.setNewColor(red: CGFloat(redColorSlider.value),
                             green: CGFloat(greenColorSlider.value),
                             blue: CGFloat(blueColorSlider.value))
 
//MARK: - Reveal navigation controller elements for root VC
        navigationController?.popToRootViewController(animated: true)
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationItem.setHidesBackButton(false, animated: false)
    }
    
    
    @IBAction func slidersColorChanging() {
        //vars for usability
        let redValue = CGFloat(redColorSlider.value)
        let greenValue = CGFloat(greenColorSlider.value)
        let blueValue = CGFloat(blueColorSlider.value)
        //change text
        redColorLabel.text = String(format: "%.2f", redColorSlider.value)
        greenColorLabel.text = String(format: "%.2f", greenColorSlider.value)
        blueColorLabel.text = String(format: "%.2f", blueColorSlider.value)
        //change color of view
        viewToChange.backgroundColor = UIColor(displayP3Red: redValue, green: greenValue, blue: blueValue, alpha: 1)
    }
}
