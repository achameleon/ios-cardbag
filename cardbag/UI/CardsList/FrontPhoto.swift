//
//  FrontPhoto.swift
//  CardBag
//
//  Created by Admin on 24.10.2018.
//  Copyright © 2018 arcMi. All rights reserved.
//

import UIKit

class FrontPhoto: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var card: CardRepository?
    var cardName: String = ""
    var category: CategoryList?
    var sale: String = ""
    var frontImage: UIImage?
    
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
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            let imag = UIImagePickerController()
            imag.delegate = self
            imag.sourceType = UIImagePickerController.SourceType.photoLibrary;
            imag.allowsEditing = true
            self.present(imag, animated: true, completion: nil)
        }
    }
        

    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any])
    {
        let selectedImage : UIImage = info[UIImagePickerControllerEditedImage] as! UIImage
        myImageView.image = selectedImage
        frontImage = selectedImage
        self.dismiss(animated: true, completion: nil)
    }
    
    func nextPage() {
        let next = RearPhoto()
        next.card = card
        next.cardName = cardName
        next.category = category
        next.sale = sale
        next.frontPhoto = frontImage
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
