//
//  QuizTableViewCell.swift
//  Eduapp
//
//  Created by alaa gharbi on 2/12/2022.
//

import UIKit

class QuizTableViewCell: UITableViewCell {
    @IBOutlet weak var cellImageVew: UIImageView!
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var levelLb: UILabel!
    @IBOutlet weak var questionLb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        cellImageVew.layer.cornerRadius = 10.0
        cellImageVew.layer.masksToBounds = true
//        cellView.layer.cornerRadius = 1.0
//        cellView.layer.masksToBounds = true
        self.layer.cornerRadius = 10.0
        self.layer.masksToBounds = true    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
