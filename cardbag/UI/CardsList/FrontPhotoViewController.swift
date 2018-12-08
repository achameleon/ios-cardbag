//
//  FrontPhotoViewController.swift
//  CardBag
//
//  Created by Admin on 24.10.2018.
//  Copyright © 2018 arcMi. All rights reserved.
//

import UIKit

class FrontPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var cardName: String = ""
    var category: TestData?
    var sale: String = ""
    
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnPhoto: UIButton!
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var lblCategories: UILabel!
    @IBOutlet weak var lblSale: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnNext.setTitle("ДАЛЕЕ", for: .normal)
        lblCategories.layer.cornerRadius = 12
        lblSale.layer.cornerRadius = 12
        btnNext.layer.cornerRadius = 24
        
        lbl.text = "Лицевая сторона"
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = cardName
        lblCategories.text = category?.title
        lblSale.text = sale
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onChangeBtn(_ sender: Any) {
        nextPage()
    }
    
    @IBAction func makePhoto(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera){
            let imag = UIImagePickerController()
            imag.delegate = self
            imag.sourceType = UIImagePickerController.SourceType.camera;
            imag.allowsEditing = true
            self.present(imag, animated: true, completion: nil)
        }
    }
        
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        let selectedImage : UIImage = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
        myImageView.image = selectedImage
        self.dismiss(animated: true, completion: nil)
    }
    
    func nextPage() {
        let next = RearPhotoViewController()
        next.cardName = cardName
        next.category = category
        next.sale = sale
        navigationController?.pushViewController(next, animated: true)
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
