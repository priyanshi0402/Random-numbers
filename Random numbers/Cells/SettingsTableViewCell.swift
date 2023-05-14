//
//  SettingsTableViewCell.swift
//  WatchFacesApp
//
//  Created by SARVADHI on 28/08/22.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    @IBOutlet weak var extraView: UIView!
    @IBOutlet weak var imgArrow: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var uiSwitch: UISwitch!
    @IBOutlet weak var viewBg: CustomView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
