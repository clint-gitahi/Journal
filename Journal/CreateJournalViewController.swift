

import UIKit

class CreateJournalViewController: UIViewController {

    
    @IBOutlet weak var aboveNavBarView: UIView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var journalTextView: UITextView!
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var setDate: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navBar.barTintColor = UIColor(red: 0.298, green: 0.757, blue: 0.988, alpha: 1.00)
        
        navBar.tintColor = .white
        navBar.isTranslucent = false
        navBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        aboveNavBarView.backgroundColor = UIColor(red: 0.298, green: 0.757, blue: 0.988, alpha: 1.00)
    }
    @IBAction func cancelTapped(_ sender: Any) {
        
    }
    
    @IBAction func saveTapped(_ sender: Any) {
    }
    
    @IBAction func setDateTapped(_ sender: Any) {
    }
    @IBAction func blueCalendarTapped(_ sender: Any) {
    }
    @IBAction func blueCameraTapped(_ sender: Any) {
    }
}
