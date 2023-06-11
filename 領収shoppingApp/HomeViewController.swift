//
//  HomeViewController.swift
//  領収shoppingApp
//
//  Created by NOZOMI ISHII on 2023/04/04.
//
import Foundation
import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var addButton: UIButton!
    
    var memoDataList: [MemoDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        setMemoData()
        configureButton()

    }
    
    @IBAction func addButton(_ sender: Any) {
        let memoDetilViewController = MemoDetailViewController()
        present(memoDetilViewController, animated: true)
    }
    
    
    func setMemoData() {
        for i in 1...5 {
            let memoDataModel = MemoDataModel()
            memoDataModel.memoTitle = "このメモは\(i)番目のメモです。"
            memoDataList.append(memoDataModel)
        }
    }
    
    func configureButton() {
        addButton.layer.cornerRadius = addButton.bounds.width / 2
    }

}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        // indexPath.row->UITableviewに表示されるcellの(0から始まる)通し番号が順番に渡される
        let memoDataModel: MemoDataModel = memoDataList[indexPath.row]
        cell.textLabel?.text = memoDataModel.memoTitle
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case.delete:
            memoDataList.remove(at: indexPath.row)
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
