import UIKit

class PortfolioController: UIViewController, PieChartDelegate {
    
    @IBOutlet var piechart: PieChart!
    @IBOutlet var balance: UIView!
    @IBOutlet var aapl: UIView!
    @IBOutlet var twtr: UIView!
    @IBOutlet var amzn: UIView!
    @IBOutlet var msft: UIView!
    @IBOutlet var withdraw: UIButton!
    @IBOutlet var scrollview: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        
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
        
        scrollview.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height+600)
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
