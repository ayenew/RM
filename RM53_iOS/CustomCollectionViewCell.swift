import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var title: UIButton!
    @IBOutlet weak var amount: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let random: CGFloat = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        title.backgroundColor = UIColor(red: 0.5, green: random, blue: random, alpha: 1)
    }

}
