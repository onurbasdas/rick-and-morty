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
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: FeedCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? FeedCell else {
            return UITableViewCell()
        }
        let character = results[indexPath.row]
        cell.setUpWith(characterModel: character)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetailsVC", sender: self)
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


