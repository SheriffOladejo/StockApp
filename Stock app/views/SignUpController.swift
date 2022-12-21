import UIKit

class SignUpController: UIViewController {
    
    @IBOutlet var first_name: UITextField!
    @IBOutlet var last_name: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var confirm_password: UITextField!
    @IBOutlet var signup: UIButton!
    
    @IBOutlet var login_password: UITextField!
    @IBOutlet var login_email: UITextField!
    @IBOutlet var forgot_password: UILabel!
    @IBOutlet var login: UIButton!
    
    @IBOutlet var sign_up_text: UILabel!
    @IBOutlet var sign_up_line: UIView!
    @IBOutlet var t_and_c: UIView!
    
    @IBOutlet var login_text: UILabel!
    @IBOutlet var login_line: UIView!
    
    @IBOutlet var scrollview: UIScrollView!
    
    @IBAction func openHome(){
        performSegue(withIdentifier: "goToNavigationBar", sender: self)
    }
    
    @IBAction func hideLogin(){
        
        //show sign up views
        sign_up_text.textColor = hexStringToUIColor(hex: "#5A81BE")
        sign_up_line.backgroundColor = hexStringToUIColor(hex: "#5A81BE")
        first_name.isHidden = false
        last_name.isHidden = false
        email.isHidden = false
        password.isHidden = false
        confirm_password.isHidden = false
        signup.isHidden = false
        t_and_c.isHidden = false
        
        // hide login views
        login_text.textColor = UIColor.gray
        login_line.backgroundColor = UIColor.white
        login_password.isHidden = true
        login_email.isHidden = true
        forgot_password.isHidden = true
        login.isHidden = true
    }
    
    @IBAction func hideRegister(){
        // show login views
        login_text.textColor = hexStringToUIColor(hex: "#5A81BE")
        login_line.backgroundColor = hexStringToUIColor(hex: "#5A81BE")
        login_password.isHidden = false
        login_email.isHidden = false
        forgot_password.isHidden = false
        login.isHidden = false
        
        // hide sign up views
        sign_up_text.textColor = UIColor.gray
        sign_up_line.backgroundColor = UIColor.white
        first_name.isHidden = true
        last_name.isHidden = true
        email.isHidden = true
        password.isHidden = true
        confirm_password.isHidden = true
        signup.isHidden = true
        t_and_c.isHidden = true
    }
    
    func addDoneButtonOnKeyboard(){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default

        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))

        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()

        first_name.inputAccessoryView = doneToolbar
        last_name.inputAccessoryView = doneToolbar
        email.inputAccessoryView = doneToolbar
        password.inputAccessoryView = doneToolbar
        confirm_password.inputAccessoryView = doneToolbar
        
        login_email.inputAccessoryView = doneToolbar
        login_password.inputAccessoryView = doneToolbar
    }

    @objc func doneButtonAction(){
        first_name.resignFirstResponder()
        last_name.resignFirstResponder()
        email.resignFirstResponder()
        password.resignFirstResponder()
        forgot_password.resignFirstResponder()
        
        login_password.resignFirstResponder()
        login_email.resignFirstResponder()
    }
    
    
    private func roundTextFields(){
        scrollview.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height+600)
        let login_tap = UITapGestureRecognizer(target: self, action: #selector(hideRegister))
        login_text.isUserInteractionEnabled = true
        login_text.addGestureRecognizer(login_tap)
        
        let login_tap_ = UITapGestureRecognizer(target: self, action: #selector(openHome))
        login.isUserInteractionEnabled = true
        login.addGestureRecognizer(login_tap_)
        signup.addGestureRecognizer(login_tap_)
        
        let register_tap = UITapGestureRecognizer(target: self, action: #selector(hideLogin))
        sign_up_text.isUserInteractionEnabled = true
        sign_up_text.addGestureRecognizer(register_tap)
        
        self.addDoneButtonOnKeyboard()
        
        first_name.layer.cornerRadius = first_name.frame.size.height/3.5
        first_name.layer.borderWidth = 1
        first_name.clipsToBounds = true
        
        last_name.layer.cornerRadius = last_name.frame.size.height/3.5
        last_name.layer.borderWidth = 1
        last_name.clipsToBounds = true
        
        email.layer.cornerRadius = email.frame.size.height/3.5
        email.layer.borderWidth = 1
        email.clipsToBounds = true
        
        password.layer.cornerRadius = password.frame.size.height/3.5
        password.layer.borderWidth = 1
        password.clipsToBounds = true
        
        confirm_password.layer.cornerRadius = confirm_password.frame.size.height/3.5
        confirm_password.layer.borderWidth = 1
        confirm_password.clipsToBounds = true
        
        login_password.layer.cornerRadius = login_password.frame.size.height/3.5
        login_password.layer.borderWidth = 1
        login_password.clipsToBounds = true
        
        login_email.layer.cornerRadius = login_email.frame.size.height/3.5
        login_email.layer.borderWidth = 1
        login_email.clipsToBounds = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        roundTextFields()
        hideLogin()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToNavigationBar" {
            guard let vc = segue.destination as? NavigationController else { return }
        }
    }
}
