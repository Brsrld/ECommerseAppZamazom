import Foundation

//MARK: Protocols

protocol ViewModelAddDataProtocol {
    func AddDataFromModel(with name:String ,with price:String ,with overview:String ,with sortOverview:String ,with category:String ,with imageURL:String)
}

//MARK: Model Logic

final class AddProductViewModel:NSObject {
        
    let addDatas: AddData = AddData()
    let updateImage: UploadImage = UploadImage()
    
    func AddDataFromModel (with title:String ,with price:String ,with overview:String ,with sortOverview:String ,with category:String ,with imageURL:String) {
        addDatas.AddData(with: title, with: price, with: overview, with: sortOverview, with: category ,with: imageURL)
    }
    
    func updateImage(image:Data ,imagePath:String) {
        updateImage.uploadImage(image:image, imagePath:imagePath)
    }
    
    func downloadURL(imagePath:String, completion: @escaping (URL?, Error?) -> Void) {
      updateImage.downloadImage(imagePath: imagePath, completion: completion)
    }
}

extension AddProductViewModel:ViewModelAddDataProtocol {}
