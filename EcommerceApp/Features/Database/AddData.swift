import Foundation

//MARK: Add Data Protocol

protocol AddDataProtocol {
    func AddData(with title:String ,with price:String ,with overview:String ,with sortOverview:String ,with category:String ,with imageURL:String)
}

//MARK: Add Product to Firebase

final class AddData: AddDataProtocol {
    
    let getDate: DateConverting = DateConverting()
    let uploadImageData: UploadImage = UploadImage()
    
    func AddData (with title:String ,with price:String ,with overview:String ,with sortOverview:String ,with category:String ,with imageURL:String) {
        let ref = Constants.db.collection(Constants.FStore.collectionName).addDocument(data: [
            Constants.FStore.title: title,
            Constants.FStore.price: price,
            Constants.FStore.date: getDate.ConvertDate(),
            Constants.FStore.category:category,
            Constants.FStore.overview: overview,
            Constants.FStore.sortOverview: sortOverview,
            Constants.FStore.imageURL:imageURL
           
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added")
            }
        }
    }
}
