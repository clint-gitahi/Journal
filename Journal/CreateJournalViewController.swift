

import UIKit

class CreateJournalViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var aboveNavBarView: UIView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var journalTextView: UITextView!
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var setDate: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    
    var date = Date()
    var imagePicker = UIImagePickerController()
    var images : [UIImage] = []
    var
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navBar.barTintColor = UIColor(red: 0.298, green: 0.757, blue: 0.988, alpha: 1.00)
        
        navBar.tintColor = .white
        navBar.isTranslucent = false
        navBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        aboveNavBarView.backgroundColor = UIColor(red: 0.298, green: 0.757, blue: 0.988, alpha: 1.00)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        imagePicker.delegate = self
        
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
        dismiss(animated: true, completion: nil)
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
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let chosenImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            images.append(chosenImage)
            
            //adding image to the stack view.
            let imageView = UIImageView()
            imageView.heightAnchor.constraint(equalToConstant: 70.0).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 70.0).isActive = true
            imageView.image = chosenImage
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
            stackView.addArrangedSubview(imageView)
            imagePicker.dismiss(animated:true) {
                // animation
                
            }
        }
    }
}
