//
//  PassValueViewController.swift
//  DemoSwift
//
//  Created by Arthur on 2017/8/11.
//  Copyright © 2017年 Arthur. All rights reserved.
//

import UIKit

class PassValueViewController: UIViewController {
    
    let cellID:String = "section1Cell"
    var tableView: UITableView?
    
    let titleArray = [
        "闭包传值",
        "代理传值",
        "通知传值",
        "AppDelegate单例传值"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
    }
    
    func setupTableView() {
        
        tableView = UITableView(frame: KScreenBounds, style: .plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.rowHeight = 40
        tableView?.tableFooterView = UIView.init()
        view.addSubview(tableView!)
        
        
        
    }
    
    
    
}


extension PassValueViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: cellID)
            cell?.accessoryType = .disclosureIndicator
            cell?.selectionStyle = .none
        }
        cell?.textLabel?.text = titleArray[indexPath.row]
        cell?.textLabel?.font = SYSTEMFONT(size: 15)
        return cell!
    }
}

extension PassValueViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            navigationController?.pushViewController(ClosureViewController(), animated: true)
        case 1:
            navigationController?.pushViewController(DelegateViewController(), animated: true)
        case 2:
            navigationController?.pushViewController(NotifictionViewController(), animated: true)
        case 3:
            navigationController?.pushViewController(SingleViewController(), animated: true)
        default:
            break
        }
        
        
    }
}
