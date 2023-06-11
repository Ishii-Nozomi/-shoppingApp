//
//  MemoDetailViewController.swift
//  領収shoppingApp
//
//  Created by NOZOMI ISHII on 2023/04/05.
//
import Foundation
import UIKit
import RealmSwift


class MemoDetailViewController: UIViewController {

    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var inputTitleTextField: UITextField!
    @IBOutlet weak var memoTableView: UITableView!
    
    let realm = try! Realm()

    var array: [MemoDataModel] = []
    
    
    enum Cell: Int, CaseIterable {
        case TableViewCell
        case AddButtonTableViewCell
        
        var cellIdentifier: String {
            switch self {
            case.TableViewCell: return "cell"
            case.AddButtonTableViewCell: return "ButtonCell"
            }
        }
    }
    
    
    @IBAction func cancelButton(_ sender: Any) {
        // アラートを表示させる
        let alert = UIAlertController(title: "メモの保存", message: "メモの変更が保存されていませんが、よろしいですか？", preferredStyle: .alert)
        // メモの変更なしでホーム画面に戻る
        let close = UIAlertAction(title: "OK", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        // メモ詳細画面に戻る
        let cancel = UIAlertAction(title: "キャンセル", style: .cancel) { (action) in
            alert.dismiss(animated: true)
        }
        
        alert.addAction(close)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memoTableView.dataSource = self
        memoTableView.delegate = self
        memoTableView.register(UINib(nibName: "TableViewCell", bundle: nil),forCellReuseIdentifier: "cell")
        memoTableView.register(UINib(nibName: "AddButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "ButtonCell")
        memoTableView.register(UINib(nibName: "TableFooterView", bundle: nil), forHeaderFooterViewReuseIdentifier: "TableFooterView")
        inputTitleTextField.placeholder = "タイトル"


    }

    private func totalPrice() -> Int {
        var total = 0
        
        // filter -> {}内の条件で絞る
        // forEach -> 配列の中身を全部ループさせる
        array.filter{ $0.isChecked }.forEach{ info in
            let price = Int(info.price)
            total += price ?? 0
        }
        return total
    }
    

}


extension MemoDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // arrayに格納されているShoppingInfoの数だけセルが生成される
        // 追加ボタンセルを作りたいので +1　する
        return array.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType: Cell
        if indexPath.row == array.count {
            // 最後のセルを追加ボタンセルにする
            // 全部でarray.count+1個あるので、最後のセルのインデックスはarray.countになる
            cellType = .AddButtonTableViewCell
        } else {
            cellType = .TableViewCell
        }
        switch cellType {
        case.TableViewCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.cellIdentifier) as! TableViewCell
            // セルの行番号に該当する情報を取得
            let info = array[indexPath.row]
            // 取得した情報をセルにセット
            cell.memoText.text = info.memo
            cell.priceText.text = info.price
            
            // 税率ボタンの選択状態の初期化
            cell.tax8Button.isSelected = false
            cell.tax10Button.isSelected = false
            // 情報に合わせて選択状態をセット
            if info.tax == .tax8 {
                cell.tax8Button.isSelected = true
            } else if info.tax == .tax10 {
                cell.tax10Button.isSelected = true
            }
            return cell
        case .AddButtonTableViewCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.cellIdentifier) as! AddButtonTableViewCell
            cell.delegate = self
            return cell
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        view.tintColor = .systemBlue
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case.delete:
            array.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        case.insert, .none:
            break
        @unknown default:
            fatalError()
        }
    }
    
    
}

extension MemoDetailViewController: TableViewDelegate {
    func buttonTapAction() {
        // 追加ボタンを押した時の処理
//        let cell: TableViewCell = TableViewCell.initForomNid()
//        array.append(cell)
        
        // 空の買い物情報を追加する
        let newInfo = MemoDataModel()
        array.append(newInfo)
        
        memoTableView.reloadData()
    }
}
