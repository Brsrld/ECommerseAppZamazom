import Foundation

//MARK: Read Data Protocol

protocol ReadDataProtocol {
    mutating func readData(completion: @escaping ([Product]) -> Void)
}

//MARK: Fetch Data From Firebase

final class  ReadData: ReadDataProtocol {
    
    var products: [Product] = []
    
    func readData(completion: @escaping ([Product]) -> Void) {

        let collectionRef = Constants.db.collection(Constants.FStore.collectionName)
        collectionRef.getDocuments { [self] (querySnapshot, err) in
            
            self.products = []
            
            if let docs = querySnapshot?.documents {
                for docSnapshot in docs {
                    let data = docSnapshot.data()
                    if let title = data[Constants.FStore.title] as? String, let category = data[Constants.FStore.category] as? String ,
                       let price = data[Constants.FStore.price] as? String , let overview = data[Constants.FStore.overview] as? String ,
                       let sortOverview = data[Constants.FStore.sortOverview] as? String , let date = data[Constants.FStore.date] as? String, let documentID = docSnapshot.documentID as? String , let imageURL = data[Constants.FStore.imageURL] as? String  {
                        
                        let newProduct = Product(category: category, price: price, title: title, overview: overview, sortOverview: sortOverview, addDate: date ,documentID: documentID, imageURL: imageURL)
                        self.products.append(newProduct)
                    }
                }
            }
            completion(products)
        }
    }
}

