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
    
    var memoDataList: [MemoDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        setMemoData()

    }
    
    func setMemoData() {
        for i in 1...5 {
            let memoDataModel = MemoDataModel(memoTitle: "このメモは\(i)番目のメモです。")
            memoDataList.append(memoDataModel)
        }
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
    
    
}
