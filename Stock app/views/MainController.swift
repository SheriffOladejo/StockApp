import UIKit

class MainController: UIViewController {
    
    @IBOutlet var emailButton: UIButton!
    @IBOutlet var facebookButton: UIButton!
    @IBOutlet var googleButton: UIButton!
    @IBOutlet var create_account: UIView!
    
    private func roundButton(){
        emailButton.layer.cornerRadius = 26
        emailButton.clipsToBounds = true
        facebookButton.layer.cornerRadius = 26
        facebookButton.clipsToBounds = true
        googleButton.layer.cornerRadius = 26
        googleButton.clipsToBounds = true
    }
    
    @IBAction func login(){
        performSegue(withIdentifier: "goToNavigationBar", sender: self)
    }
    
    @IBAction func openSignUp(){
        let storyboard = UIStoryboard(name: "SignUp", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier: "sign_up")
        self.present(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundButton()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToNavigationBar" {
            guard let vc = segue.destination as? NavigationController else { return }
        }
    }
}

