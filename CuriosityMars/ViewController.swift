//
//  ViewController.swift
//  CuriosityMars
//
//  Created by İstemihan Çelik on 18.03.2021.
//

import UIKit

class ViewController: UITableViewController {
    var images = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Mars Curiosity Rover"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        let fileManager = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fileManager.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("pia"){
                images.append(item)
            }
            images.sort()
        }
        
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Image", for: indexPath)
        cell.textLabel?.text = images[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = storyboard?.instantiateViewController(identifier: "Curiosity") as? DetailViewController {
            
            viewController.selectedImage = images[indexPath.row]
            
            navigationController?.pushViewController(viewController, animated: true)
            
            viewController.detailTitle = "Image \(indexPath.row+1) of \(images.count) "
            
        }
    }


}

