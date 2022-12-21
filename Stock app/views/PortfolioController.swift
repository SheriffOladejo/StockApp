import UIKit

class PortfolioController: UIViewController, PieChartDelegate {
    
    // bond details outlets
    @IBOutlet var long_term: UIView!
    @IBOutlet var nbfc: UIView!
    @IBOutlet var private_sector: UIView!
    @IBOutlet var bond_scrollview: UIScrollView!
    @IBOutlet var ishares: UIView!
    @IBOutlet var citi: UIView!
    @IBOutlet var aero: UIView!
    @IBOutlet var credit: UIView!
    
    // stock details outlets
    @IBOutlet var one_day: UIView!
    @IBOutlet var one_week: UIView!
    @IBOutlet var one_month: UIView!
    @IBOutlet var one_year: UIView!
    @IBOutlet var all: UIView!
    @IBOutlet var order_book: UIView!
    @IBOutlet var transaction_history: UIView!
    @IBOutlet var details_scrollview: UIScrollView!
    
    // portfolio outlets
    @IBOutlet var piechart: PieChart!
    @IBOutlet var balance: UIView!
    @IBOutlet var withdraw: UIButton!
    @IBOutlet var scrollview: UIScrollView!
    @IBOutlet var aapl: UIView!
    @IBOutlet var twtr: UIView!
    @IBOutlet var amzn: UIView!
    @IBOutlet var msft: UIView!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToStockDetails" {
            guard let vc = segue.destination as? StockDetailsController else { return }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        initializeDetails()
        initializeBonds()
    }
    
    @IBAction func openPortfolio(){
        scrollview.isHidden = false
        details_scrollview.isHidden = true
        bond_scrollview.isHidden = true
        navigationItem.title = "Portfolio"
        navigationItem.leftBarButtonItems = []
    }
    
    @IBAction func openBondDetails () {
        scrollview.isHidden = true
        bond_scrollview.isHidden = false
        let back = UIBarButtonItem(
            image: UIImage(systemName: "arrow.backward"), style: .plain,
            target: self, action: #selector(openPortfolio))
        back.tintColor = .black
        navigationItem.leftBarButtonItems = [back]
        navigationItem.title = "Bond Details"
    }
    
    @IBAction func openStockDetails() {
        scrollview.isHidden = true
        details_scrollview.isHidden = false
        let back = UIBarButtonItem(
            image: UIImage(systemName: "arrow.backward"), style: .plain,
            target: self, action: #selector(openPortfolio))
        back.tintColor = .black
        navigationItem.leftBarButtonItems = [back]
        navigationItem.title = "Stock Details"
        //performSegue(withIdentifier: "goToStockDetails", sender: self)
    }
    
    func initializeBonds() {
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
        
        bond_scrollview.isHidden = true
    }
    
    func initializeDetails(){
        details_scrollview.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height+480)
        details_scrollview.isHidden = true
        
        
        order_book.layer.cornerRadius = 8
        order_book.layer.borderWidth = 1
        order_book.clipsToBounds = true
        order_book.layer.borderColor = hexStringToUIColor(hex: "#5A81BE").cgColor
        
        transaction_history.layer.cornerRadius = 8
        transaction_history.layer.borderWidth = 1
        transaction_history.clipsToBounds = true
        transaction_history.layer.borderColor = hexStringToUIColor(hex: "#5A81BE").cgColor
        
        one_day.layer.cornerRadius = 8
        one_day.layer.borderWidth = 1
        one_day.clipsToBounds = true
        one_day.layer.borderColor = hexStringToUIColor(hex: "#5A81BE").cgColor
        
        all.layer.cornerRadius = 8
        all.layer.borderWidth = 1
        all.clipsToBounds = true
        all.layer.borderColor = hexStringToUIColor(hex: "#5A81BE").cgColor
        
        one_week.layer.cornerRadius = 8
        one_week.layer.borderWidth = 1
        one_week.clipsToBounds = true
        one_week.layer.borderColor = hexStringToUIColor(hex: "#5A81BE").cgColor
        
        one_month.layer.cornerRadius = 8
        one_month.layer.borderWidth = 1
        one_month.clipsToBounds = true
        one_month.layer.borderColor = hexStringToUIColor(hex: "#5A81BE").cgColor
        
        one_year.layer.cornerRadius = 8
        one_year.layer.borderWidth = 1
        one_year.clipsToBounds = true
        one_year.layer.borderColor = hexStringToUIColor(hex: "#5A81BE").cgColor
    }
    
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
        
        let stock_details = UITapGestureRecognizer(target: self, action: #selector(openStockDetails))
        let stock_details2 = UITapGestureRecognizer(target: self, action: #selector(openStockDetails))
        let stock_details3 = UITapGestureRecognizer(target: self, action: #selector(openStockDetails))
        let stock_details4 = UITapGestureRecognizer(target: self, action: #selector(openStockDetails))
        
        let bond_details = UITapGestureRecognizer(target: self, action: #selector(openBondDetails))
        let bond_details2 = UITapGestureRecognizer(target: self, action: #selector(openBondDetails))
        let bond_details3 = UITapGestureRecognizer(target: self, action: #selector(openBondDetails))
        let bond_details4 = UITapGestureRecognizer(target: self, action: #selector(openBondDetails))
        
        aapl.isUserInteractionEnabled = true
        amzn.isUserInteractionEnabled = true
        twtr.isUserInteractionEnabled = true
        msft.isUserInteractionEnabled = true
        
        aapl.addGestureRecognizer(stock_details)
        amzn.addGestureRecognizer(stock_details2)
        msft.addGestureRecognizer(stock_details3)
        twtr.addGestureRecognizer(stock_details4)
        
        ishares.isUserInteractionEnabled = true
        citi.isUserInteractionEnabled = true
        credit.isUserInteractionEnabled = true
        aero.isUserInteractionEnabled = true
        
        ishares.addGestureRecognizer(bond_details)
        citi.addGestureRecognizer(bond_details2)
        credit.addGestureRecognizer(bond_details3)
        aero.addGestureRecognizer(bond_details4)
        
        scrollview.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height+700)
        roundCorners()
        piechart.selectedOffset = 0
        piechart.layers = [createCustomViewsLayer(), createTextLayer()]
        piechart.delegate = self
        piechart.models = createModels()
    }
    
    fileprivate func createModels() -> [PieSliceModel] {
        let alpha: CGFloat = 0.5
        
        return [
            PieSliceModel(value: 2.1, color: UIColor.yellow.withAlphaComponent(alpha)),
            PieSliceModel(value: 3, color: UIColor.blue.withAlphaComponent(alpha)),
            PieSliceModel(value: 1, color: UIColor.green.withAlphaComponent(alpha)),
            PieSliceModel(value: 4, color: UIColor.cyan.withAlphaComponent(alpha)),
        ]
    }
    
    func roundCorners(){
        
        withdraw.layer.borderWidth = 1
        withdraw.layer.cornerRadius = 8
        withdraw.layer.borderColor = UIColor.white.cgColor
        
        balance.layer.cornerRadius = 16
        balance.layer.borderWidth = 1
        balance.clipsToBounds = true
        balance.layer.borderColor = hexStringToUIColor(hex: "#5A81BE").cgColor
        
        aapl.layer.cornerRadius = 16
        aapl.layer.borderWidth = 1
        aapl.clipsToBounds = true
        
        twtr.layer.cornerRadius = 16
        twtr.layer.borderWidth = 1
        twtr.clipsToBounds = true
        
        amzn.layer.cornerRadius = 16
        amzn.layer.borderWidth = 1
        amzn.clipsToBounds = true
        
        msft.layer.cornerRadius = 16
        msft.layer.borderWidth = 1
        msft.clipsToBounds = true
    }
    
    func onSelected(slice: PieSlice, selected: Bool) {
        print("Selected: \(selected), slice: \(slice)")
    }
    
    fileprivate func createCustomViewsLayer() -> PieCustomViewsLayer {
        let viewLayer = PieCustomViewsLayer()
        
        let settings = PieCustomViewsLayerSettings()
        settings.viewRadius = 135
        settings.hideOnOverflow = false
        viewLayer.settings = settings
        
        viewLayer.viewGenerator = createViewGenerator()
        
        return viewLayer
    }
        
    fileprivate func createTextLayer() -> PiePlainTextLayer {
        let textLayerSettings = PiePlainTextLayerSettings()
        textLayerSettings.viewRadius = 60
        textLayerSettings.hideOnOverflow = true
        textLayerSettings.label.font = UIFont.systemFont(ofSize: 12)
        
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 1
        textLayerSettings.label.textGenerator = {slice in
            return formatter.string(from: slice.data.percentage * 100 as NSNumber).map{"\($0)%"} ?? ""
        }
        
        let textLayer = PiePlainTextLayer()
        textLayer.settings = textLayerSettings
        return textLayer
    }
    
    fileprivate func createViewGenerator() -> (PieSlice, CGPoint) -> UIView {
        return {slice, center in
            
            let container = UIView()
            container.frame.size = CGSize(width: 100, height: 40)
            container.center = center
            let view = UIImageView()
            view.frame = CGRect(x: 30, y: 0, width: 40, height: 40)
            container.addSubview(view)
            
            let specialTextLabel = UILabel()
            specialTextLabel.textAlignment = .center
            if slice.data.id == 0 {
                specialTextLabel.text = ""
                specialTextLabel.font = UIFont.systemFont(ofSize: 14)
            }else if slice.data.id == 1 {
                specialTextLabel.font = UIFont.systemFont(ofSize: 14)
                specialTextLabel.text = ""
            }else if slice.data.id == 2 {
                specialTextLabel.font = UIFont.systemFont(ofSize: 14)
                specialTextLabel.text = ""
            }else if slice.data.id == 3 {
                specialTextLabel.font = UIFont.systemFont(ofSize: 14)
                specialTextLabel.text = ""
            }
            specialTextLabel.sizeToFit()
            specialTextLabel.frame = CGRect(x: 0, y: 40, width: 100, height: 20)
            container.addSubview(specialTextLabel)
            container.frame.size = CGSize(width: 100, height: 60)
            
            let imageName: String? = {
                switch slice.data.id {
                case 0: return "twtr"
                case 1: return "appl"
                case 2: return "msft"
                case 3: return "amzn"
                default: return nil
                }
            }()
            
            //view.image = imageName.flatMap{UIImage(named: $0)}
            
            return container
        }
    }
}
