//
//  ViewController.swift
//  PhotoLibrary
//
//  Created by Kaan Aslan on 5.04.2019.
//  Copyright © 2019 CSD. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    let ipc = UIImagePickerController()

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    @IBAction func choosePhotoButtonClicked(_ sender: Any)
    {
        ipc.sourceType = .photoLibrary
        ipc.delegate = self
        self.present(ipc, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        self.imageView.image = info[UIImagePickerController.InfoKey.originalImage]! as? UIImage
        self.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        print("canceled")
    }
}

