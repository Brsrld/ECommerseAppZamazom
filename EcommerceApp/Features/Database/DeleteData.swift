import Foundation

//MARK: Delete Data Protocol

protocol DeleteDataProtocol {
      func deleteData(documentName:String)
}

//MARK: Delete Data From Firebase

final class  DeleteData: DeleteDataProtocol {
    
     func deleteData(documentName:String){
        Constants.db.collection(Constants.FStore.collectionName).document(documentName).delete()
     { err in
        if let err = err {
            print("Error updating document: \(err)")
        } else {
            print("Document successfully updated")
        }
    }
    }
}
