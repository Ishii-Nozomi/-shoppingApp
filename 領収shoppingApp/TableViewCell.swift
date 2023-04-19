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

        
    }
    
}
