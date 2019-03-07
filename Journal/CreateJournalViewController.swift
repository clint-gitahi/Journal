

import UIKit

class CreateJournalViewController: UIViewController {

    
    @IBOutlet weak var aboveNavBarView: UIView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var journalTextView: UITextView!
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var setDate: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    
    var date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navBar.barTintColor = UIColor(red: 0.298, green: 0.757, blue: 0.988, alpha: 1.00)
        
        navBar.tintColor = .white
        navBar.isTranslucent = false
        navBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        aboveNavBarView.backgroundColor = UIColor(red: 0.298, green: 0.757, blue: 0.988, alpha: 1.00)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateDate()
    }
    
    func updateDate() {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, MMM d, yyyy"
        navBar.topItem?.title = formatter.string(from: date)
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        changeKeyboardHeight(notification: notification)
    }
    
    @objc func keyboardWillShow(notification:Notification) {
        changeKeyboardHeight(notification: notification)
    }
    
    func changeKeyboardHeight(notification:Notification) {
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyHeight = keyboardFrame.cgRectValue.height
            bottomConstraint.constant = keyHeight + 10
        }
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        
    }
    
    @IBAction func saveTapped(_ sender: Any) {
    }
    
    @IBAction func setDateTapped(_ sender: Any) {
        journalTextView.isHidden = false
        datePicker.isHidden = true
        setDate.isHidden = true
        date = datePicker.date
        updateDate()
    }
    @IBAction func blueCalendarTapped(_ sender: Any) {
        journalTextView.isHidden = true
        datePicker.isHidden = false
        setDate.isHidden = false
    }
    @IBAction func blueCameraTapped(_ sender: Any) {
    }
}
