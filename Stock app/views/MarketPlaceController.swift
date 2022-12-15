import UIKit

extension UITextField{

    func setLeftImage(imageName:String) {

        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        self.leftView = imageView;
        self.rightViewMode = .always
    }
    
    func setRightImage(imageName:String) {

        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        self.rightView = imageView;
        self.rightViewMode = .always
    }
}

class MarketPlaceController: UIViewController {
    
    @IBOutlet var scrollview: UIScrollView!
    @IBOutlet var search: UITextField!
    
    @IBOutlet var btn1: UIButton!
    @IBOutlet var btn2: UIButton!
    @IBOutlet var btn3: UIButton!
    @IBOutlet var btn4: UIButton!
    @IBOutlet var btn5: UIButton!
    @IBOutlet var btn6: UIButton!
    @IBOutlet var btn7: UIButton!
    @IBOutlet var btn8: UIButton!
    @IBOutlet var btn9: UIButton!
    @IBOutlet var btn10: UIButton!
    @IBOutlet var btn11: UIButton!
    
    func addDoneButtonOnKeyboard(){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default

        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))

        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()

        search.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction(){
        search.resignFirstResponder()
    }
    
    func initialize(){
        self.addDoneButtonOnKeyboard()
        scrollview.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height+100)
        
        search.layer.cornerRadius = search.frame.size.height/3.5
        search.layer.borderWidth = 1
        search.clipsToBounds = true
        
        search.setRightImage(imageName: "settings.png")
        search.setLeftImage(imageName: "search.png")
        
        btn1.layer.borderWidth = 1
        btn1.layer.cornerRadius = 8
        btn1.clipsToBounds = true
        btn1.layer.borderColor = UIColor.white.cgColor
        
        btn2.layer.borderWidth = 1
        btn2.layer.cornerRadius = 8
        btn2.layer.borderColor = UIColor.white.cgColor
        btn2.clipsToBounds = true
        
        btn3.layer.borderWidth = 1
        btn3.layer.cornerRadius = 8
        btn3.clipsToBounds = true
        btn3.layer.borderColor = UIColor.white.cgColor
        
        btn4.layer.borderWidth = 1
        btn4.layer.cornerRadius = 8
        btn4.clipsToBounds = true
        btn4.layer.borderColor = UIColor.white.cgColor
        
        btn5.layer.borderWidth = 1
        btn5.layer.cornerRadius = 8
        btn5.clipsToBounds = true
        btn5.layer.borderColor = UIColor.white.cgColor
        
        btn6.layer.borderWidth = 1
        btn6.layer.cornerRadius = 8
        btn6.clipsToBounds = true
        btn6.layer.borderColor = UIColor.white.cgColor
        
        btn7.layer.borderWidth = 1
        btn7.layer.cornerRadius = 8
        btn7.clipsToBounds = true
        btn7.layer.borderColor = UIColor.white.cgColor
        
        btn8.layer.borderWidth = 1
        btn8.layer.cornerRadius = 8
        btn8.clipsToBounds = true
        btn8.layer.borderColor = UIColor.white.cgColor
        
        btn9.layer.borderWidth = 1
        btn9.layer.cornerRadius = 8
        btn9.clipsToBounds = true
        btn9.layer.borderColor = UIColor.white.cgColor
        
        btn10.layer.borderWidth = 1
        btn10.layer.cornerRadius = 8
        btn10.clipsToBounds = true
        btn10.layer.borderColor = UIColor.white.cgColor
        
        btn11.layer.borderWidth = 1
        btn11.layer.cornerRadius = 8
        btn11.clipsToBounds = true
        btn11.layer.borderColor = UIColor.white.cgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}
