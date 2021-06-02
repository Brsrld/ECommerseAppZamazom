import Foundation

//MARK: Protocols

protocol UpdateDataViewModelProtocol {
    func UpdateDataFromModel(documentName:String ,title:String ,price:String ,overview:String ,category:String ,sortOverview:String)
}

//MARK: Model Logic

final class UpdateDataViewModel:NSObject {
    
    let updateData: UpdateData = UpdateData()
    
    func UpdateDataFromModel (documentName:String ,title:String ,price:String ,overview:String ,category:String ,sortOverview:String) {
        updateData.updateData(documentName: documentName, title: title, price: price, overview: overview, category: category, sortOverview: sortOverview)
    }
}

extension UpdateDataViewModel:UpdateDataViewModelProtocol {}
