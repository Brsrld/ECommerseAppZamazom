import Foundation

//MARK: Protocols

protocol ProductViewModelProtocol {
    func getData(completion: @escaping ([Product]) -> Void)
}

//MARK: Model Logic

final class ProductViewModel:NSObject {
    
    let getDatas: ReadData = ReadData()
    
    func getData(completion: @escaping ([Product]) -> Void) {
        getDatas.readData(completion: completion)
    }
}

extension ProductViewModel:ProductViewModelProtocol{}
