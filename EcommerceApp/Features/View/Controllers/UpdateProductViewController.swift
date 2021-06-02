import UIKit

class UpdateProductViewController: UIViewController {
    
    //MARK: Variables
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var overviewTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var sortOverviewTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    
    private let updateService: UpdateDataViewModel = UpdateDataViewModel()
    
    var products:Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultTextFieldText()
    }
    
    //MARK: Update Functions
    
    func defaultTextFieldText() {
        titleTextField.text = products?.title
        overviewTextField.text = products?.overview
        priceTextField.text = products?.price
        sortOverviewTextField.text = products?.sortOverview
        categoryTextField.text = products?.category
    }
    
    @IBAction func updateSelectedData(_ sender: UIButton) {
        updateService.UpdateDataFromModel(
            documentName:products?.documentID ?? Constants.nilValue
            ,title: titleTextField.text ?? Constants.nilValue
            ,price: priceTextField.text ?? Constants.nilValue
            ,overview: overviewTextField.text ?? Constants.nilValue
            ,category: categoryTextField.text ?? Constants.nilValue
            ,sortOverview: sortOverviewTextField.text ?? Constants.nilValue )
        
        let alert = UIAlertController(title: "Upload Allert", message: "Product has been uploaded successfully.", preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { UIAlertAction in
            self.navigationController?.popToRootViewController(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
