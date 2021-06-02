import UIKit
import Kingfisher

class ProductCollectionViewCell: UICollectionViewCell {
    
    //MARK: UI Components
    
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius  = 10
        productImage.layer.cornerRadius = layer.cornerRadius
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 1, height: 1)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        productImage.frame = CGRect(x: 0, y: 20, width: contentView.frame.size.width, height: contentView.frame.size.height - 20 )
        titleLabel.frame = CGRect(x: 10 , y: 5 , width: contentView.frame.size.width , height: 10)
    }
    
    //MARK: UI Functions
    
    func configure (with title: String, with sortOverview: String, with price: String, with imageURL:String) {
        titleLabel.text = title
        overviewLabel.text = sortOverview
        priceLabel.text = price
        productImage.kf.setImage(with: URL(string: imageURL))
        
    }
}


