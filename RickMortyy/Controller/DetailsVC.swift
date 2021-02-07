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

//    var selectedName : String?
//    var selectedGender : String?
//    var selectedStatus : String?
//    var selectedImage = UIImage()


//        let url = URL(string: "\(results)")
//        let currentImage = results[3].image
//        let url = URL(string: "\(currentImage)")



//        self.characterImage.downloadImage(from: url!)

//        characterName.text = selectedName
//        characterGender.text = selectedGender
//        characterStatus.text = selectedStatus
//        characterImage.image = selectedImage
//        characterImage.sd_setImage(with: URL(string: results!.image)!)


//      if selectedImage == characterImage {
//        characterImage.sd_setImage(with: URL(string: (results?.image)!), completed: nil)
//      }
//



//    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
//       URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
//    }
//    func downloadImage(from url: URL) {
//       getData(from: url) {
//          data, response, error in
//          guard let data = data, error == nil else {
//             return
//          }
//          DispatchQueue.main.async() {
//            self.selectedImage = UIImage(data: data)!
//         }
//       }
//    }



//extension UIImageView {
//   func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
//      URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
//   }
//   func downloadImage(from url: URL) {
//      getData(from: url) {
//         data, response, error in
//         guard let data = data, error == nil else {
//            return
//         }
//         DispatchQueue.main.async() {
//            self.image = UIImage(data: data)
//         }
//      }
//   }
//}
