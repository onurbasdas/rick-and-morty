//
//  ViewController.swift
//  RickMortyy
//
//  Created by Onur Başdaş on 6.02.2021.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let parser = Parser()
    var results = [Result](){
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    
    
//    var chosenNames = ""
//    var chosenGender = ""
//    var choosenStatus = ""
//    var choosenImage = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .black
        
        parser.parse {
            data in
            self.results = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
        tableView.delegate = self
        tableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
        //        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: FeedCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? FeedCell else {
            return UITableViewCell()
        }
        let character = results[indexPath.row]
        cell.setUpWith(characterModel: character)
        return cell
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        //        cell.characterNameLabel.text = results[indexPath.row].name
        //        cell.characterImageView.sd_setImage(with: URL(string: results[indexPath.row].image))
        //        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetailsVC", sender: self)
        //        let selected = results[indexPath.row]
        //        chosenNames = selected.name
        //        chosenGender = selected.gender
        //        choosenStatus = selected.status
        //        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetailsVC" {
            if let characterDetailVC = segue.destination as? DetailsVC {
                if let indexPath = tableView.indexPathForSelectedRow {
                    characterDetailVC.character = results[indexPath.row]
                }
            }
        }
    }
}


//        if segue.identifier == "toDetailsVC"{
//
//            let destinationVC = segue.destination as! DetailsVC
//            destinationVC.selectedName = chosenNames
//            destinationVC.selectedGender = chosenGender
//            destinationVC.selectedStatus = choosenStatus
//            destinationVC.selectedImage = choosenImage
//
//        }

