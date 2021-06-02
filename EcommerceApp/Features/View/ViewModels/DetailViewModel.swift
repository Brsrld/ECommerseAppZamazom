import Foundation

//MARK: Protocols

protocol DetailViewModelProtocol {
    func DeleteDataFromModel(documentName:String)
}

//MARK: Model Logic

final class DetailViewModel:NSObject {
        
    let deleteData: DeleteData = DeleteData()
    
    func DeleteDataFromModel (documentName:String) {
        deleteData.deleteData(documentName: documentName)
    }
}

extension DetailViewModel:DetailViewModelProtocol {}
