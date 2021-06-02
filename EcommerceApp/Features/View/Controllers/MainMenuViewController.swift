import UIKit

class MainMenuViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK: Animation Functions
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated )
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = Constants.nilValue 
        var charIndex = 0
        let titleText = "Zomazon🛒"
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.2 * Double(charIndex), repeats: false) { (timer) in
                self.titleLabel.text?.append(letter)
            }
            charIndex += 1
        }
    }
    
    @IBAction func goToSeeAllProuct(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier:Constants.productViewConrollerIdentifier) as? ProductViewController
        navigationController?.pushViewController(vc! , animated: true)
    }
    
    @IBAction func goToAddProduct(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier:Constants.seeAllProductViewControllerIdentifier) as? AddProductViewController
        navigationController?.pushViewController(vc! , animated: true)
    }
}

