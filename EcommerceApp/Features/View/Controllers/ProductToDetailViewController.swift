import UIKit
import Kingfisher

class ProductToDetailViewController: UIViewController {
    
    //MARK: Variables
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    private let deleteService: DetailViewModel = DetailViewModel()
    
    var products:Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupContent()
    }
    
    //MARK: To Make Delete Functions
    
    func SetupContent() {
        titleLabel.text = products?.title
        categoryLabel.text = products?.category
        overviewLabel.text = products?.overview
        priceLabel.text = products?.price
        productImage.kf.setImage(with: URL(string: products?.imageURL ?? Constants.nilValue))
    }
    
    func DeleteData(){
        deleteService.DeleteDataFromModel(documentName: products?.documentID ?? "")
    }
    
    @IBAction func deleteButtonPressed(_ sender: UIButton) {
        DeleteData()
        
        let alert = UIAlertController(title: "Delete Allert", message: "Product has been deleted successfully.", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { UIAlertAction in
            self.navigationController?.popToRootViewController(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func goToUpdate(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier:Constants.updateProductViewControllerIdentifier) as? UpdateProductViewController
        vc?.products = products
        navigationController?.pushViewController(vc! , animated: true)
    }
}
