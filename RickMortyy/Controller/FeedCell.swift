//
//  FeedCell.swift
//  RickMortyy
//
//  Created by Onur Başdaş on 6.02.2021.
//

import UIKit

class FeedCell: UITableViewCell {
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    func setUpWith(characterModel character: Result) {
        speciesLabel.text = character.species
        characterNameLabel.text = character.name
        characterImageView.sd_setImage(with: URL(string: character.image), completed: nil)
    }
    
    
}
