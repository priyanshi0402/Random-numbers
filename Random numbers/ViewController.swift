//
//  ViewController.swift
//  Random numbers
//
//  Created by SARVADHI on 02/05/23.
//

import UIKit
import Toast_Swift

var minNum = 200000
var maxNum = 600000

class ViewController: UIViewController {

    @IBOutlet weak var lblNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.lblNumber.text = Int.random(in: minNum...maxNum).toString
        // Do any additional setup after loading the view.
    }

    @IBAction func actionSettings(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SettingViewController") as! SettingViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func actionShare(_ sender: Any) {
        self.shareText(string: self.lblNumber.text ?? "No number")
    }
    
    @IBAction func actionCopy(_ sender: Any) {
        UIPasteboard.general.string = self.lblNumber.text
        self.view.makeToast("Copied to clipboard!", duration: 1.0, position: .center)
    }
    
    @IBAction func actionGenerate(_ sender: Any) {
        self.lblNumber.text = Int.random(in: minNum...maxNum).toString
    }
    
    func shareText(string: String) {
        let activityItems : NSArray = [string]
        let activityVC : UIActivityViewController = UIActivityViewController(activityItems: activityItems as! [Any], applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
    }
    
}

extension Int {
    static func random(in range: ClosedRange<Int>, excluding x: Int) -> Int {
        if range.contains(x) {
            let r = Int.random(in: Range(uncheckedBounds: (range.lowerBound, range.upperBound)))
            return r == x ? range.upperBound : r
        } else {
            return Int.random(in: range)
        }
    }
    
    var toString: String {
        return String(self)
    }
}


