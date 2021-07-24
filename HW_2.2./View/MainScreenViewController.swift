//
//  MainScreenViewController.swift
//  HW_2.2.
//
//  Created by Maxim Mitin on 24.07.21.
//

import UIKit

protocol MainScreenVCDelegate {
    func setNewColor(red: CGFloat, green: CGFloat, blue: CGFloat)
}

class MainScreenViewController: UIViewController {
    @IBOutlet var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? SettingsViewController else {return}
        navigationVC.colorForView = mainView.backgroundColor
        navigationVC.delegate = self
    }
}

//MARK: - Extensions
extension MainScreenViewController: MainScreenVCDelegate {
    func setNewColor(red: CGFloat, green: CGFloat, blue: CGFloat) {
        mainView.backgroundColor = UIColor(displayP3Red: red, green: green, blue: blue, alpha: 1)
    }
}
