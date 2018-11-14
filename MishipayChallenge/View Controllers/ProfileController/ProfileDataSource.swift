//
//  ProfileDataSource.swift
//  MishipayChallenge
//
//  Created by apple on 14/11/18.
//  Copyright © 2018 Praveen. All rights reserved.
//

import UIKit

class ProfileDataSource: NSObject {
    
    let menuCellId = "ProfileMenuTableViewCell"
    
    let menus: [String] = ["My Card", "My Purchase", "Send Us a feedback", "Rate us on App Store", "About", "Report Bug"]
   
    var tableView: UITableView? {
        didSet {
            self.tableView?.dataSource = self
            self.tableView?.delegate = self
            self.tableView?.register(UINib(nibName: menuCellId, bundle: nil), forCellReuseIdentifier: menuCellId)
        }
    }
}

extension ProfileDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = self.tableView?.dequeueReusableCell(withIdentifier: menuCellId, for: indexPath) as? ProfileMenuTableViewCell {
            cell.menuLabel.text = menus[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension ProfileDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Item clicked")
        self.tableView?.deselectRow(at: indexPath, animated: false)
    }
}

