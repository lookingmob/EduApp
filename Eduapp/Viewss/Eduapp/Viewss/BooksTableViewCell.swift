//
//  BooksTableViewCell.swift
//  Eduapp
//
//  Created by alaa gharbi on 5/12/2022.
//tableview books

import UIKit

class BooksTableViewCell: UITableViewCell {
    @IBOutlet weak var booktitle: UILabel!
    
    @IBOutlet weak var degree: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
