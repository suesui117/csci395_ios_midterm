//
//  ViewController.swift
//  csci395_ios_midterm
//
//  Created by Sue Sui on 11/2/25.
//

import UIKit

class ViewController: UIViewController, SecondVCDelegate {

    

    @IBOutlet weak var backgroundImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImageView.backgroundColor = .black
        backgroundImageView.contentMode = .scaleAspectFill
    }

    //programmatically called the segue, click on the segue to give it an identifier name
    @IBAction func buttonPressed(_ sender: Any) {
        performSegue(withIdentifier: "secondvc", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? secondvc{
            destination.delegate = self
        }
    }
    
    func didSelectImage(_ image: UIImage) {
        backgroundImageView.image = image
    }
}

