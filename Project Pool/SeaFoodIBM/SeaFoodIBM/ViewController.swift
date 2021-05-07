//
//  ViewController.swift
//  SeaFoodIBM
//
//  Created by Mehmet Durmaz on 17.07.2018.
//  Copyright © 2018 Mehmet Durmaz. All rights reserved.
//


import UIKit
import Foundation
import VisualRecognitionV3
import SVProgressHUD
import Social

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var topBar: UIImageView!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var welcomeHotdog: UIImageView!
    
    let apiKey = "VdfYgG8JC5T6HXiW4zBapLFCmPEY9qCs5ADSdmh2Yelb"
    let version = "2018-07-17"
    
    
    
    let imagePicker = UIImagePickerController()
    //var classificationResult : [[String : Double]] = []
    var classificationResult : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shareButton.isHidden = true
        imagePicker.delegate = self
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        cameraButton.isEnabled = false
        SVProgressHUD.show()
        shareButton.isHidden = true
        var compressedImage : UIImage
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            //            let imgOrgData: NSData = NSData(data: UIImageJPEGRepresentation((image), 1)!)
            //            // var imgData: NSData = UIImagePNGRepresentation(image)
            //            // you can also replace UIImageJPEGRepresentation with UIImagePNGRepresentation.
            //            let imageOrgSize: Int = imgOrgData.length
            //            print("size of image in KB: %f ", Double(imageOrgSize) / 1024.0)
            
            //            let imgData: NSData = NSData(data: UIImageJPEGRepresentation((compressedImage), 1)!)
            //            // var imgData: NSData = UIImagePNGRepresentation(image)
            //            // you can also replace UIImageJPEGRepresentation with UIImagePNGRepresentation.
            //            let imageSize: Int = imgData.length
            //            print("size of image in KB: %f ", Double(imageSize) / 1024.0)
            
            
            //let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            //let url = documentsURL.appendingPathComponent("tempImage.jpg")
            //try? imageData?.write(to: url, options: [])
            
            welcomeHotdog.isHidden = true
            imageView.image = image
            imagePicker.dismiss(animated: true, completion: nil)
            
            guard let imageData = UIImageJPEGRepresentation(image, 0.01) else { fatalError("dosyayı küçültürkene hata") }
            compressedImage = UIImage(data: imageData)!
            
            let visualRecognition = VisualRecognition(version: version, apiKey: apiKey)
            let failure = { (error: Error) in print(error) }
            
            visualRecognition.classify(image: compressedImage, failure: failure) { classifiedImages in
                
                let classes = classifiedImages.images.first!.classifiers.first!.classes
                
                self.classificationResult = []
                
                for index in 1..<classes.count {
                    //self.classificationResult.append([classes[index].className : classes[index].score!])
                    self.classificationResult.append(classes[index].className)
                }
                if self.classificationResult.contains("sandwich") {
                    DispatchQueue.main.async {
                        self.navigationItem.title = "HOTDOG"
                        self.navigationController?.navigationBar.barTintColor = UIColor.green
                        self.navigationController?.navigationBar.isTranslucent = false
                        self.topBar.image = UIImage(named: "HOTDOG")
                    }
                } else {
                    DispatchQueue.main.async {
                        self.navigationItem.title = "NOT HOTDOG"
                        self.navigationController?.navigationBar.barTintColor = UIColor.red
                        self.navigationController?.navigationBar.isTranslucent = false
                        self.topBar.image = UIImage(named: "NOTHOTDOG")
                    }
                }
                
                print(self.classificationResult)
                
                DispatchQueue.main.async {
                    self.cameraButton.isEnabled = true
                    SVProgressHUD.dismiss()
                    self.shareButton.isHidden = false
                }
            }
        } else {
            print("resim almada hata")
        }
    }
    @IBAction func shareButtonTapped(_ sender: UIButton) {
       
        let shareText = navigationItem.title!
        
        if let image = UIImage(named: "WELCOME") {
            let vc = UIActivityViewController(activityItems: [shareText, image], applicationActivities: [])
            present(vc, animated: true)
        }
    }
    
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false
        present(imagePicker, animated: true, completion: nil)
    }
}



