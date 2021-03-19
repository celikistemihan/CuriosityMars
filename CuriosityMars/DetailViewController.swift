//
//  DetailViewController.swift
//  CuriosityMars
//
//  Created by İstemihan Çelik on 18.03.2021.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var detailTitle: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        navigationItem.largeTitleDisplayMode = .never
        title = detailTitle
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(share))
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }

    }
    @objc func share(){
        guard let image = imageView.image?.jpegData(compressionQuality: 1.0)
        else {
            print("No image exist")
            return
        }
        
        let viewController = UIActivityViewController(activityItems: [image], applicationActivities: [])
        //For iPad
        viewController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(viewController, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

  
}
