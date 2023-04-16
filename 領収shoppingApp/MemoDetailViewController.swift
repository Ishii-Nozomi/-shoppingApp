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
        inputTitleTextField.placeholder = "タイトル"


    }

    

}


extension MemoDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Cell.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = Cell(rawValue: indexPath.row)!
        switch cellType {
        case.TableViewCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.cellIdentifier) as! TableViewCell
            return cell
        case .AddButtonTableViewCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.cellIdentifier) as! AddButtonTableViewCell
            return cell
        }
    }
    
    
}
