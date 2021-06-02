import UIKit
import Firebase

//MARK: Protocols

protocol ProductCollectionViewProtocol {
    func update (items: [Product])
}

protocol ProductCollectionViewOutput: AnyObject {
    func getStoryBoard() -> UIStoryboard?
    func getNavCont() -> UINavigationController?
}

final class ProductCollectionView: NSObject{
    
    private lazy var items: [Product] = []
    
    weak var delegate: ProductCollectionViewOutput?
    
    //MARK: CollectionView Functions
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        
        if let dataCell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.productCollectionViewCellIdentifier, for: indexPath) as? ProductCollectionViewCell {
            dataCell.configure(with: items[indexPath.row].title ?? Constants.nilValue , with: items[indexPath.row].sortOverview ?? Constants.nilValue , with: items[indexPath.row].price ?? Constants.nilValue, with: items[indexPath.row].imageURL ?? Constants.nilValue)
            cell = dataCell
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = delegate?.getStoryBoard()?.instantiateViewController(identifier:Constants.productToDetailViewControllerIdentifier) as? ProductToDetailViewController
        vc?.products = items[indexPath.row]
        delegate?.getNavCont()?.pushViewController(vc! , animated: true)
    }
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    let columns: CGFloat = 1.25
    let collectionViewWidth = collectionView.bounds.width
    let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
    let spaceBetweenCells = flowLayout.minimumInteritemSpacing * (columns - 1)
    let sectionInsets = flowLayout.sectionInset.left + flowLayout.sectionInset.right
    let adjustedWidth = collectionViewWidth - spaceBetweenCells - sectionInsets
    let width: CGFloat = floor(adjustedWidth / columns)
    let height: CGFloat = width / 2
    return CGSize(width: width, height: height)
}

//MARK: Extensions

extension ProductCollectionView:  UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout  {}
extension ProductCollectionView: ProductCollectionViewProtocol {
    func update (items: [Product]) {
        self.items = items
    }
}
