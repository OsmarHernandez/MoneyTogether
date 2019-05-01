//
//  PopUpViewController.swift
//  MoneyTogether
//
//  Created by Antonio Spinola Flores on 5/1/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func confirmButton(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
