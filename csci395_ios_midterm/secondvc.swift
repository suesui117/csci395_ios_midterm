//
//  secondvc.swift
//  csci395_ios_midterm
//
//  Created by Sue Sui on 11/2/25.
//

import UIKit

// this protocal is called in first screen, fulfills 7a.
protocol SecondVCDelegate: AnyObject {
    func didSelectImage(_ image: UIImage)
}


struct ImageItem {
    var imageName: String
    var title: String
}



class secondvc: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var mytableview: UITableView!
    
    
    weak var delegate: SecondVCDelegate?
    
    
    let myImages = [
        ImageItem(imageName: "image 1", title: "Gradient 1"),
        ImageItem(imageName: "image 2", title: "Gradient 2"),
        ImageItem(imageName: "image 3", title: "Gradient 3")
    ]

    // 1. create an outlet to the table view in secondvc storyboard
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // 2. set the delegate and datasoruce for the table view to this VC itselding using the self keyword
        mytableview.delegate = self
        mytableview.dataSource = self
        
        // where is my table view getting its table from? its getting from this class
        
        // whos the delegate, first screen will change based on my choice.
        
    }
    
    
    /* 3 functions here:
    a.    numberOfRowsInSection
    b.    cellForRowAt
    c.    DidSelectRowAt
     */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myImages.count // we are rendering the len() of myImages
    }

    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // determines what kind of cell to display + whatever custom configuration to make on the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        let item = myImages[indexPath.row]
        
        
        if let imageView = cell.viewWithTag(1) as? UIImageView,
           let label = cell.viewWithTag(2) as? UILabel{
            imageView.image = UIImage(named: item.imageName)
            imageView.contentMode = .scaleAspectFit
            label.text = item.title
        }
            
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Get the selected image
        let selectedItem = myImages[indexPath.row]
        
        if let selectedImage = UIImage(named: selectedItem.imageName) {
            // Notify the delegate (first screen)
            delegate?.didSelectImage(selectedImage)
        }
        
        // Dismiss this screen
        dismiss(animated: true, completion: nil)
    }


}
