//
//  JournalTableViewController.swift
//  Journal
//
//  Created by clinton gitahi on 05/03/2019.
//  Copyright © 2019 clinton gitahi. All rights reserved.
//

import UIKit

class JournalTableViewController: UITableViewController {

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var cameraButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        addButton.imageView?.contentMode = .scaleAspectFit
        cameraButton.imageView?.contentMode = .scaleAspectFit
    }

    @IBAction func cameraTapped(_ sender: Any) {
    }
    @IBAction func addTapped(_ sender: Any) {
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    

}
