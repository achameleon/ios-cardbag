//
//  RearPhotoViewController.swift
//  CardBag
//
//  Created by Admin on 24.10.2018.
//  Copyright © 2018 arcMi. All rights reserved.
//

import UIKit

class RearPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var lbl: UILabel!
    @IBOutlet var btnSave: UIButton!
    @IBOutlet weak var lblCategories: UILabel!
    @IBOutlet weak var lblSale: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBAction func makePhoto(_ sender: Any) {
//        let myPickerController = UIImagePickerController()
//        myPickerController.delegate = self;
//        myPickerController.sourceType = UIImagePickerController.SourceType.camera
//        
//        self.present(myPickerController, animated: true, completion: nil)
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera){
            let imag = UIImagePickerController()
            imag.delegate = self
            imag.sourceType = UIImagePickerController.SourceType.camera;
            imag.allowsEditing = false
            self.present(imag, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!) {
        let selectedImage : UIImage = image
        myImageView.image = selectedImage
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnSave.layer.cornerRadius = 24
        btnSave.setTitle("СОХРАНИТЬ КАРТУ", for: .normal)
        lblCategories.layer.cornerRadius = 12
        lblSale.layer.cornerRadius = 12
        lbl.text = "Тыльная сторона"
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "Спортмастер"        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
