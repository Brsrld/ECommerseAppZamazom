import Foundation
import Firebase
import FirebaseStorage

//MARK: Global Constans

struct Constants {
    
    static let productCollectionViewCellIdentifier = "ProductCell"
    static let db = Firestore.firestore()
    static let storege = Storage.storage().reference()
    static let addProductNavigationTitle = "Add New Product"
    static let productNavigationTitle = "Zamazon"
    static let detailNavigationTitle = "Detail"
    static let seeAllProductsSegueIdentifier = "goToProduct"
    static let addProductsSegueIdentifier = "goToAddProduct"
    static let productViewConrollerIdentifier  = "ProductViewController"
    static let seeAllProductViewControllerIdentifier  = "SeeAllProductViewController"
    static let productToDetailViewControllerIdentifier = "ProductToDetailViewController"
    static let updateProductViewControllerIdentifier = "UpdateProductViewController"
    static let mainMenuViewControllerIdentifier = "MainMenuViewController"
    static let nilValue = ""
    
//MARK: Firebase Store Constants
    
    struct FStore {
        static let collectionName = "Products"
        static let category = "Category"
        static let price = "Price"
        static let title = "Title"
        static let overview = "Overview"
        static let sortOverview = "Sort Overview"
        static let date = "Date"
        static let imageURL = "ImageURL"
    }
}

