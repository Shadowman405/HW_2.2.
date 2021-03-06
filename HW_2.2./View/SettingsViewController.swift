//
//  ViewController.swift
//  HW_2.2.
//
//  Created by Maxim Mitin on 10.07.21.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {
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
    //txt fields
    @IBOutlet weak var redTxtField: UITextField!
    @IBOutlet weak var greenTxtField: UITextField!
    @IBOutlet weak var blueTxtField: UITextField!
    //variables
    var checkNum = "1"
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
        
        redTxtField.delegate = self
        greenTxtField.delegate = self
        blueTxtField.delegate = self
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
    
    //MARK:  new slider action
    @IBAction func setColor(_ sender: UISlider) {
        setColorForView()
        
        switch sender {
        case redColorSlider:
            setValue(for: redColorLabel)
            redTxtField.text = string(from: redColorSlider)
        case greenColorSlider:
            setValue(for: greenColorLabel)
            greenTxtField.text = string(from: greenColorSlider)
        default:
            setValue(for: blueColorLabel)
            blueTxtField.text = string(from: blueColorSlider)
        }
    }
    
    private func setColorForView() {
        viewToChange.backgroundColor = UIColor(
            red: CGFloat(redColorSlider.value),
            green: CGFloat(greenColorSlider.value),
            blue: CGFloat(blueColorSlider.value),
            alpha: 1
        )
    }
    
// Switching between text fields by keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == redTxtField {
            textField.resignFirstResponder()
            greenTxtField.becomeFirstResponder()
        } else if textField == greenTxtField {
            textField.resignFirstResponder()
            blueTxtField.becomeFirstResponder()
        } else if textField == blueTxtField {
            textField.resignFirstResponder()
        }
        return true
    }
    
 //Switching slider values by textfields
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case redTxtField:
                guard let textRed = redTxtField.text else {return}
                if textRed <= checkNum {
                    redColorSlider.value = Float(textRed) ?? 0.0
                    redColorLabel.text = textRed
                    setColorForView()
                } else {
                    redColorSlider.value = 0
                    redColorLabel.text = "0.00"
                    redTxtField.text = "0"
                }
        case greenTxtField:
                guard let greenText = greenTxtField.text else {return}
                if greenText <= checkNum {
                    greenColorSlider.value = Float(greenText) ?? 0.0
                    greenColorLabel.text = greenText
                    setColorForView()
                } else {
                    greenColorSlider.value = 0
                    greenColorLabel.text = "0.00"
                    greenTxtField.text = "0"
                }
        case blueTxtField:
                guard let blueText = blueTxtField.text else {return}
                if blueText <= checkNum {
                    blueColorSlider.value = Float(blueText) ?? 0.0
                    blueColorLabel.text = blueText
                    setColorForView()
                } else {
                    blueColorSlider.value = 0
                    blueColorLabel.text = "0.00"
                    blueTxtField.text = "0"
                }
        default:
            textField.resignFirstResponder()
        }
    }
}


//MARK: - Extensions
extension SettingsViewController: Comparable {
    static func < (lhs: SettingsViewController, rhs: SettingsViewController) -> Bool {
        return lhs.redTxtField.text! < rhs.checkNum
    }
    
    static func <= (lhs: SettingsViewController, rhs: SettingsViewController) -> Bool {
        return lhs.redTxtField.text! <= rhs.checkNum
            && lhs.greenTxtField.text! <= rhs.checkNum
            && lhs.blueTxtField.text! <= rhs.checkNum
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redColorLabel:
                label.text = string(from: redColorSlider)
            case greenColorLabel:
                label.text = string(from: greenColorSlider)
            default:
                label.text = string(from: blueColorSlider)
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}

