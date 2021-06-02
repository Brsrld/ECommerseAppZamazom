import Foundation

//MARK: Update Data Protocol

protocol UpdateDataProtocol {
    func updateData(documentName:String, title:String ,price:String ,overview:String  ,category:String ,sortOverview:String)
}

//MARK: Delete Data From Firebase

final class  UpdateData: UpdateDataProtocol {
    
    let getDate: DateConverting = DateConverting()
    
    func updateData(documentName:String ,title:String ,price:String ,overview:String ,category:String ,sortOverview:String) {
        Constants.db.collection(Constants.FStore.collectionName).document(documentName).updateData([
            Constants.FStore.title: title,
            Constants.FStore.price: price,
            Constants.FStore.date: getDate.ConvertDate(),
            Constants.FStore.category:category,
            Constants.FStore.overview: overview,
            Constants.FStore.sortOverview: sortOverview,
        ])
        { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
}
