//
//  ViewController.swift
//  Slider View App
//
//  Created by Vlad Zinevich on 12.05.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var colorView: UIView!

    @IBOutlet var labelRed: UILabel!
    @IBOutlet var labelGreen: UILabel!
    @IBOutlet var labelBlue: UILabel!
    
    @IBOutlet var sliderRed: UISlider!
    @IBOutlet var sliderGreen: UISlider!
    @IBOutlet var sliderBlue: UISlider!
    
    @IBOutlet var textFieldRed: UITextField!
    @IBOutlet var textFieldGreen: UITextField!
    @IBOutlet var textFieldBlue: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 15
        
        sliderRed.tintColor = .red
        sliderGreen.tintColor = .green
    }
    
    // change color with sliders
    @IBAction func rgbSlider(_ sender: UISlider) {
        switch sender.tag {
        case 0:
            labelRed.text = roundingValues(from: sender)
            textFieldRed.text = roundingValues(from: sender)
        case 1:
            labelGreen.text = roundingValues(from: sender)
            textFieldGreen.text = roundingValues(from: sender)
        case 2:
            labelBlue.text = roundingValues(from: sender)
            textFieldBlue.text = roundingValues(from: sender)
        default:
            break
        }
    }
    
    // rounding values
    private func roundingValues(from slider: UISlider) -> String {
        return String(format: "%.2f", slider.value)
    }
}

