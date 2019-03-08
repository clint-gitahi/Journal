

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
        if segue.identifier == "goToNew" {
            if let text = sender as? String {
                if text == "camera" {
                    let createVC = segue.destination as? CreateJournalViewController
                    createVC?.startWithCamera = true
                }
            }
        }
    }
}
