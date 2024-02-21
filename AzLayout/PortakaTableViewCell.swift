//
//  PortakaTableViewCell.swift
//  AzLayout
//
//  Created by Sefa Aycicek on 20.02.2024.
//

import UIKit

class PortakaTableViewCell: UITableViewCell, TableViewCellProtocol {

    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    
    var cellViewModel : PortakalViewModel? = nil
    
    func fillData(viewModel: CellViewModelProtocol) {
        self.cellViewModel = viewModel as? PortakalViewModel
        
        lbl1.text = self.cellViewModel?.name
        lbl2.text = self.cellViewModel?.surname
        lbl3.text = "\((self.cellViewModel?.age ?? 0))"
    }
    
    /*func fillCell(txt1 : String, txt2 : String, txt3 : String) {
        lbl1.text = txt1
        lbl2.text = txt2
        lbl3.text = txt3
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
