import Firebase
import UIKit

class AddProductViewController: UIViewController {
    
    //MARK: Variables
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var overviewTextField: UITextField!
    @IBOutlet weak var sortOverviewTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var uploadImage: UIImageView!
    
    var imageURL:String?
    var image:Data?
    
    private let addProductService: AddProductViewModel = AddProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.addProductNavigationTitle
    }
    
    //MARK: To Add Functions
    
    private func addData() {
        
        addProductService.downloadURL(imagePath: nameTextField.text ?? Constants.nilValue, completion: { url, error in
            self.addProductService.AddDataFromModel(
                with: self.nameTextField.text ?? Constants.nilValue ,
                with: self.priceTextField.text ?? Constants.nilValue ,
                with: self.overviewTextField.text ?? Constants.nilValue ,
                with: self.sortOverviewTextField.text ?? Constants.nilValue ,
                with: self.categoryTextField.text ?? Constants.nilValue,
                with: url?.absoluteString ?? Constants.nilValue)
        }
        )
    }
    
    @IBAction func add(_ sender: UIButton) {
        addData()
        addProductService.updateImage(image:image!, imagePath: nameTextField.text ?? Constants.nilValue )
        let alert = UIAlertController(title: "Add Allert", message: "Product has been added successfully.", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { UIAlertAction in
            self.navigationController?.popToRootViewController(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func chooseImage(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else  {
            return
        }
        guard let imageData = image.pngData() else {
            return
        }
        self.image = imageData
    }
}

extension AddProductViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {}
