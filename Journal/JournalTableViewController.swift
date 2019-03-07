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
        performSegue(withIdentifier: "goToNew", sender: "camera")
    }
    @IBAction func addTapped(_ sender: Any) {
        performSegue(withIdentifier: "goToNew", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepaing for segue")
    }
}
