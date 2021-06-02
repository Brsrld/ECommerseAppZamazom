import UIKit

class ProductViewController: UIViewController {

//MARK: Variables
  
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let readData: ReadDataProtocol = ReadData()
    
    private let productCollectionView: ProductCollectionView = ProductCollectionView()
    
    private let readProductService: ProductViewModel = ProductViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.productNavigationTitle
        initDelegate()
        getAllData()
    }
    
//MARK: Functions
    
    private func initDelegate() {
        collectionView.delegate = productCollectionView
        collectionView.dataSource = productCollectionView
        productCollectionView.delegate = self
    }
    
    private func getAllData() {
        readProductService.getData { [weak self] (models) in
            self?.productCollectionView.update(items: models)
            self?.collectionView.reloadData()
        }
    }
}

//MARK: Extensions

extension ProductViewController: ProductCollectionViewOutput {
    func getNavCont() -> UINavigationController? {
        return navigationController
    }
    
    func getStoryBoard() -> UIStoryboard? {
        return storyboard
    }
}


