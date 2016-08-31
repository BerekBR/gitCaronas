//
//  PassageiroTableViewCell.swift
//  Caronas
//
//  Created by Alexandre Wajcman on 30/08/16.
//  Copyright © 2016 Alexandre Wajcman. All rights reserved.
//

import UIKit

class PassageiroTableViewCell: UITableViewCell {

    //MARK: - Outlets
    
    @IBOutlet weak var nomeLabel: UILabel!
    
    @IBOutlet weak var vaiDeCaronaSwitch: UISwitch!
    
    //MARK: - Properties
    var delegate: PassageiroTableViewCellDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.vaiDeCaronaSwitch.on = false
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - Actions
    
    @IBAction func adicionarNaCarona(sender: UISwitch) {
        
        self.delegate?.passageiroTableViewCellSwitch(self)
    
    }
    
    
}
