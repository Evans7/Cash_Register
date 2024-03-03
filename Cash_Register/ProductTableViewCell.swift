//
//  ProductTableViewCell.swift
//  Cash_Register
//
//  Created by user235857 on 2/29/24.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productname: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var quantity: UILabel!
}
