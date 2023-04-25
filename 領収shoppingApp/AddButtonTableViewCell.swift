//
//  AddButtonTableViewCell.swift
//  領収shoppingApp
//
//  Created by NOZOMI ISHII on 2023/04/14.
//

import UIKit

protocol TableViewDelegate {
    func buttonTapAction()
}

class AddButtonTableViewCell: UITableViewCell {
    @IBOutlet weak var addCellButton: UIButton!
    
    var delegate: TableViewDelegate?
    
    
    @IBAction func addCellButton(_ sender: Any) {
        delegate?.buttonTapAction()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
