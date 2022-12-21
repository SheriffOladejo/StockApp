import UIKit

class BondDetailsController: UIViewController {
    
    @IBOutlet var long_term: UIView!
    @IBOutlet var nbfc: UIView!
    @IBOutlet var private_sector: UIView!
    
    func initialize() {
        long_term.layer.cornerRadius = 8
        long_term.layer.borderWidth = 1
        long_term.clipsToBounds = true
        long_term.layer.borderColor = hexStringToUIColor(hex: "#5A81BE").cgColor
        
        nbfc.layer.cornerRadius = 8
        nbfc.layer.borderWidth = 1
        nbfc.clipsToBounds = true
        nbfc.layer.borderColor = hexStringToUIColor(hex: "#5A81BE").cgColor
        
        private_sector.layer.cornerRadius = 8
        private_sector.layer.borderWidth = 1
        private_sector.clipsToBounds = true
        private_sector.layer.borderColor = hexStringToUIColor(hex: "#5A81BE").cgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}
