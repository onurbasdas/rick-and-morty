//
//  DetailsVC.swift
//  RickMortyy
//
//  Created by Onur Başdaş on 6.02.2021.
//

import UIKit
import SDWebImage

class DetailsVC: UIViewController {
    
    var character : Result?
    
    
    
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var characterGender: UILabel!
    @IBOutlet weak var characterStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        characterImage.sd_setImage(with: URL(string: (character?.image)!), completed: nil)
        characterName.text = character?.name
        characterGender.text = character?.gender
        characterStatus.text = character?.status
        
    }
}

