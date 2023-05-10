//
//  TableFooterView.swift
//  領収shoppingApp
//
//  Created by NOZOMI ISHII on 2023/04/24.
//

import UIKit

class TableFooterView: UIView {

    @IBOutlet weak var totalLabel: UILabel!
    

    @IBOutlet weak var totalTextLabel: UILabel!
    
    @IBOutlet weak var yenLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        loadNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    func loadNib() {
        let view = Bundle(for: type(of: self)).loadNibNamed("TableFooterView", owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
    
}
