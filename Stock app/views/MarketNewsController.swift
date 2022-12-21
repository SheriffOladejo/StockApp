import UIKit

class MarketNewsController: UIViewController {
    @IBOutlet var scrollview: UIScrollView!
    
    @IBOutlet var v1: UIView!
    @IBOutlet var v2: UIView!
    @IBOutlet var v3: UIView!
    @IBOutlet var v4: UIView!
    
    func initialize(){
        let search = UIBarButtonItem(
            image: UIImage(systemName: "magnifyingglass"), style: .plain,
            target: self, action: nil)
        let bell = UIBarButtonItem(
            image: UIImage(systemName: "bell"), style: .plain,
            target: self, action: nil)
        bell.tintColor = .black
        search.tintColor = .black
        navigationItem.rightBarButtonItems = [bell, search]
        scrollview.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height+150)
        
        v1.layer.cornerRadius = 10
        v1.clipsToBounds = true

        v2.layer.cornerRadius = 10
        v2.clipsToBounds = true

        v3.layer.cornerRadius = 10
        v3.clipsToBounds = true

        v4.layer.cornerRadius = 10
        v4.clipsToBounds = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}
