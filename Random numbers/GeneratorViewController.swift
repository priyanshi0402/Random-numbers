//
//  GeneratorViewController.swift
//  Random numbers
//
//  Created by SARVADHI on 03/05/23.
//

import UIKit

class GeneratorViewController: UIViewController {

    @IBOutlet weak var maxTxt: CustomTextField!
    @IBOutlet weak var minTxt: CustomTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.minTxt.delegate = self
        self.maxTxt.delegate = self
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnBackClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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

extension GeneratorViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.minTxt {
            minNum = textField.text?.toInt ?? 1
        } else if textField == self.maxTxt {
            maxNum = textField.text?.toInt ?? 1
        }
    }
}

extension String {
    var toInt: Int {
        return Int(self) ?? 1
    }
}
