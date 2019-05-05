//
//  RequestViewController.swift
//  MoneyTogether
//
//  Created by Osmar Hernández on 04/05/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import UIKit

class RequestViewController: UIViewController {
    
    // TODO: Implement with enum
    let plan = ["Weekly", "Biweekly", "Monthly"]
    let term = ["One Year", "Two Years", "Three Years"]
    
    @IBOutlet weak var amountTextField: UITextField!
    
    @IBOutlet weak var planButton: UIButton!
    @IBOutlet weak var termButton: UIButton!
    
    @IBOutlet weak var planPickerView: UIPickerView!
    @IBOutlet weak var termPickerView: UIPickerView!
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .currency
        
        return nf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        amountTextField.addDoneButtonOnKeyboard()
    }
    
    @IBAction func planButton(_ sender: UIButton) {
        planPickerView.isHidden = false
        sender.isHidden = true
    }
    
    @IBAction func termButton(_ sender: UIButton) {
        termPickerView.isHidden = false
        sender.isHidden = true
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension RequestViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text, let number = Double(text) {
            if let value = numberFormatter.string(from: NSNumber(value: number)) {
                textField.text = value
            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let countDots = textField.text!.components(separatedBy: ".").count - 1
        
        return countDots > 0 && string == "." ? false : true
    }
}

extension RequestViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerView == planPickerView ? plan.count : term.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerView == planPickerView ? plan[row] : term[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == planPickerView {
            planButton.setTitle(plan[row], for: .normal)
            planPickerView.isHidden = true
            planButton.isHidden = false
        } else if pickerView == termPickerView {
            termButton.setTitle(term[row], for: .normal)
            termPickerView.isHidden = true
            termButton.isHidden = false
        }
    }
}
