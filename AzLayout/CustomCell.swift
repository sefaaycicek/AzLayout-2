//
//  CustomCell.swift
//  AzLayout
//
//  Created by Sefa Aycicek on 20.02.2024.
//

import UIKit

class CustomCell: UITableViewCell, TableViewCellProtocol {

    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var customImageView: UIImageView!
    
    var cellViewModel : AyvaViewModel? = nil
    
    func fillData(viewModel: CellViewModelProtocol) {
        self.cellViewModel = viewModel as? AyvaViewModel
        
        if let image = self.cellViewModel?.image {
            let ratio = image.size.width / image.size.height
            
            let screenWidth = UIScreen.main.bounds.width
            let height = screenWidth / ratio
            imageHeightConstraint.constant = height
            
            customImageView.image = image
        }
    }
    
    /*func fillImage(image : UIImage?) {
        /*CGRect(x: 10, y: 10, width: 100, height: 100)
        CGSize -> w,h
        CGPoint -> x,y*/
        
        if let image = image {
            let ratio = image.size.width / image.size.height
            
            let screenWidth = UIScreen.main.bounds.width
            let height = screenWidth / ratio
            imageHeightConstraint.constant = height
        }

        customImageView.image = image
    }*/
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
