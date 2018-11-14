//
//  ProfileViewController.swift
//  MishipayChallenge
//
//  Created by apple on 14/11/18.
//  Copyright © 2018 Praveen. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet var headerImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    
    var profileDataSource: ProfileDataSource = ProfileDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        self.setupProfileDataSource()
    }
    
    func setupProfileDataSource() {
        self.profileDataSource.tableView = self.tableView
    }

    func setupViews() {
        self.headerImageView.layer.cornerRadius = 5
        self.headerImageView.clipsToBounds = true
    }
    
}
