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
        
        setColor()
        setValueForLabel()
        setValueForTextField()
        
        addDoneButtonTo(textFieldRed)
        addDoneButtonTo(textFieldGreen)
        addDoneButtonTo(textFieldBlue)
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
        setColor()
    }
    
    // rounding values
    private func roundingValues(from slider: UISlider) -> String {
        return String(format: "%.2f", slider.value)
    }
    
    // view color
    private func setColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(sliderRed.value),
                                            green: CGFloat(sliderGreen.value),
                                            blue: CGFloat(sliderBlue.value),
                                            alpha: 1)
    }
    
    private func setValueForLabel() {
        labelRed.text = roundingValues(from: sliderRed)
        labelGreen.text = roundingValues(from: sliderGreen)
        labelBlue.text = roundingValues(from: sliderBlue)
    }
    
    private func setValueForTextField() {
        textFieldRed.text = roundingValues(from: sliderRed)
        textFieldGreen.text = roundingValues(from: sliderGreen)
        textFieldBlue.text = roundingValues(from: sliderBlue)
    }
}

extension ViewController: UITextFieldDelegate {
    
    //hide keyboard on "Done"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // hide keyboard by tap outside
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        if let currentValue = Float(text) {
            switch textField.tag {
            case 0:
                sliderRed.value = currentValue
            case 1:
                sliderGreen.value = currentValue
            case 2:
                sliderBlue.value = currentValue
            default:
                break
            }
            
            setColor()
            setValueForLabel()
        } else {
            showAlert(title: "Wrong format", message: "Enter correct value")
        }
    }
}

extension ViewController {
    
    // display button "Done" on keyboard
    private func addDoneButtonTo(_ textField: UITextField) {
        let keyboardToolbar = UIToolbar()
        textField.inputAccessoryView = keyboardToolbar
        keyboardToolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDone))
        
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        keyboardToolbar.items = [flexBarButton, doneButton]
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
