import UIKit

class AccountController: UIViewController {
    
    @IBOutlet var scrollview: UIScrollView!
    @IBOutlet var withdraw: UIButton!
    
    private let floatingButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y:0, width:60, height:60))
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 30
        button.backgroundColor = hexStringToUIColor(hex: "#5A81BE")
        
        let image = UIImage(named: "support.png")
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    func initialize(){
        scrollview.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        withdraw.layer.borderWidth = 1
        withdraw.layer.cornerRadius = 8
        withdraw.layer.borderColor = hexStringToUIColor(hex: "#5A81BE").cgColor
        let gear = UIBarButtonItem(
            image: UIImage(systemName: "gear"), style: .plain,
            target: self, action: nil)
        gear.tintColor = .black
        navigationItem.rightBarButtonItems = [gear]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        view.addSubview(floatingButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        floatingButton.frame = CGRect(
            x: view.frame.size.width - 70,
            y: view.frame.size.height - 170,
            width: 60,
            height: 60
        )
    }
}
