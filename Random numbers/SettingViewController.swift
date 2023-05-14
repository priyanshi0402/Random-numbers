//
//  SettingViewController.swift
//  WatchFacesApp
//
//  Created by SARVADHI on 28/08/22.
//

import UIKit
//import MessageUI
import StoreKit
//import MBProgressHUD

class SettingViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    
    var settingsData: [SettingsData] = [.generator, .aboutUs, .share, .rate]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
   
    @IBAction func btnBackClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension SettingViewController {
    
    func setupUI() {
        self.setUpTableView()
    }
    
    func setUpTableView() {
        self.tblView.delegate = self
        self.tblView.dataSource = self
        self.tblView.registerCell(ofType: SettingsTableViewCell.self)
        
    }

}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.settingsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueCell(ofType: SettingsTableViewCell.self, forIndexPath: indexPath) else { return UITableViewCell() }
        let row = self.settingsData[indexPath.row]
        cell.lblTitle.text = row.value()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = self.settingsData[indexPath.row]
        switch row {
        case .generator:
            let vc = storyboard?.instantiateViewController(withIdentifier: "GeneratorViewController") as! GeneratorViewController
            self.navigationController?.pushViewController(vc, animated: true)
        case .aboutUs:
            self.showAlert(vc: self, title: "About Us!", message: "Welcome to our random number generator app, where we help you generate truly random numbers for any purpose. Our mission is to provide a reliable and easy-to-use tool for generating random numbers, whether you're conducting scientific experiments, selecting lottery numbers, or just having fun. With our state-of-the-art algorithm, you can generate random numbers with complete unpredictability and no bias.")
            break
        case .rate:
            self.rateApp()
        case .share:
            self.ShareMyApp()
        }
        
    }
    
    func rateApp() {
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()
        } else if let url = URL(string: "itms-apps://itunes.apple.com/app/" + "6447046704") {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    func ShareMyApp() {
        let activityItems : NSArray = ["itms-apps://itunes.apple.com/us/app/apple-store/id6447046704?mt=8"]
        let activityVC : UIActivityViewController = UIActivityViewController(activityItems: activityItems as! [Any], applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
    }
    
    func showAlert(vc: UIViewController, title: String, message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            vc.present(alert, animated: true, completion: nil)
        }
    }
    
    
}

enum SettingsData: String {
    case generator
    case aboutUs
    case rate
    case share

    func value() -> String {
        switch self {
        case .generator:
            return "Generator Settings"
        case .aboutUs:
            return "About Us"
        case .rate:
            return "Rate Us"
        case .share:
            return "Share the app with friends"
        }
    }
}

extension UITableView {
    func registerCell<T: UITableViewCell>(ofType type: T.Type) {
        let cellName = String(describing: T.self)
        
        if Bundle.main.path(forResource: cellName, ofType: "nib") != nil {
            let nib = UINib(nibName: cellName, bundle: Bundle.main)
            register(nib, forCellReuseIdentifier: cellName)
        } else {
            register(T.self, forCellReuseIdentifier: cellName)
        }
        self.separatorStyle = .none
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
    }

    func dequeueCell<T: UITableViewCell>(ofType type: T.Type, forIndexPath indexPath: IndexPath) -> T? {
        let cellName = String(describing: T.self)
        let cell = dequeueReusableCell(withIdentifier: cellName, for: indexPath) as? T
        cell?.selectionStyle = .none
        return cell
    }
}


