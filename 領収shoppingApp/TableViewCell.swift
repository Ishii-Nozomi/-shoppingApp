//
//  TableViewCell.swift
//  領収shoppingApp
//
//  Created by NOZOMI ISHII on 2023/04/08.
//
import Foundation
import UIKit

class TableViewCell: UITableViewCell {
    // 10%の税率計算ボタン
    @IBOutlet weak var tax10Button: UIButton!
    // 8%の税率計算ボタン
    @IBOutlet weak var tax8Button: UIButton!
    // 単位（円）の表示
    @IBOutlet weak var yenLable: UILabel!
    // メモ内容のテキスト
    @IBOutlet weak var memoText: UITextField!
    // 値段入力テキスト
    @IBOutlet weak var priceText: UITextField!
    // チェックボックス
    @IBOutlet weak var checkButton: UIButton!
    
    @IBAction func tax8Button(_ sender: Any) {
        let aPlaceText = Double(priceText.text!)
        let aPlaceText2 = aPlaceText! * 1.08
        let aPlaceText3 = Int(aPlaceText2)
        let eightTax = String(aPlaceText3)
        
        priceText.text = eightTax
        
    }
    
    @IBAction func tax10Button(_ sender: Any) {
        let bPlaceText = Double(priceText.text!)
        let bPlaceText2 = bPlaceText! * 1.1
        let bPlaceText3 = Int(bPlaceText2)
        let tenTax = String(bPlaceText3)
        
        priceText.text = tenTax
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        
    }
    
    class func initForomNid() -> TableViewCell {
        // xibファイルのオブジェクトをインスタンス化
        let className: String = String(describing: TableViewCell.self)
        return Bundle.main.loadNibNamed(className, owner: self, options: nil)?.first as! TableViewCell
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        memoText.placeholder = "買うもの"
        priceText.placeholder = "0"
        priceText.keyboardType = .numberPad

        
    }
    
}
