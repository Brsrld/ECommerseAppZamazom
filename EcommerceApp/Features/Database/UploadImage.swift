import UIKit

//MARK: Delete Data Protocol

protocol UploadImageProtocol {
    func uploadImage(image:Data ,imagePath:String)
}

//MARK: Delete Data From Firebase

final class UploadImage: NSObject {
    
    var urlString: String = ""
    
    func uploadImage(image:Data,imagePath:String) {
        Constants.storege.child("images/\(imagePath).png").putData(image, metadata: nil, completion: {_, error in
            guard error == nil else {
                print("Failed to upload")
                return
            }
        })
    }
    
    func downloadImage(imagePath:String, completion: @escaping (URL?, Error?) -> Void ) {
        
        Constants.storege.child("images/\(imagePath).png").downloadURL(completion: completion)
    }
}

extension UploadImage: UIImagePickerControllerDelegate,UINavigationControllerDelegate {}
