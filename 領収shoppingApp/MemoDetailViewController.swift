//
//  MemoDetailViewController.swift
//  領収shoppingApp
//
//  Created by NOZOMI ISHII on 2023/04/05.
//
import Foundation
import UIKit

class MemoDetailViewController: UIViewController {

    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var inputTitleTextField: UITextField!
    @IBOutlet weak var memoTableView: UITableView!
    

    var array = [TableViewCell(), AddButtonTableViewCell()]
    
    
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memoTableView.dataSource = self
        memoTableView.delegate = self
        memoTableView.register(UINib(nibName: "TableViewCell", bundle: nil),forCellReuseIdentifier: "cell")
        memoTableView.register(UINib(nibName: "AddButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "ButtonCell")
        let nib = UINib(nibName: "TableFooterView", bundle: nil)
        memoTableView.register(nib, forHeaderFooterViewReuseIdentifier: "TableFooterView")
        memoTableView.sectionFooterHeight = 120
        inputTitleTextField.placeholder = "タイトル"


    }

    

}


extension MemoDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType: Cell
        if indexPath.row == array.count - 1 {
            cellType = .AddButtonTableViewCell
        } else {
            cellType = .TableViewCell
        }
        switch cellType {
        case.TableViewCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.cellIdentifier) as! TableViewCell
            return cell
        case .AddButtonTableViewCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.cellIdentifier) as! AddButtonTableViewCell
            cell.delegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = memoTableView.dequeueReusableHeaderFooterView(withIdentifier: "TableFooterView")
        return view
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
        let cell: TableViewCell = TableViewCell.initForomNid()
        array.append(cell)
        memoTableView.reloadData()
    }
}
