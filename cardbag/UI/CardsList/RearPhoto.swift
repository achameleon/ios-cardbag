//
//  RearPhoto.swift
//  CardBag
//
//  Created by Admin on 24.10.2018.
//  Copyright © 2018 arcMi. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class RearPhoto: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var card: CardRepository?
    var cardName: String = ""
    var category: CategoryList?
    var sale: String = ""
    var frontPhoto: UIImage?
    var rearImage: UIImage?
    
    
    @IBOutlet var lbl: UILabel!
    @IBOutlet var btnSave: UIButton!
    @IBOutlet weak var lblCategories: UILabel!
    @IBOutlet weak var lblSale: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBAction func makePhoto(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            let imag = UIImagePickerController()
            imag.delegate = self
            imag.sourceType = UIImagePickerController.SourceType.photoLibrary;
            imag.allowsEditing = true
            self.present(imag, animated: true, completion: nil)
        }
    }
    
    @IBAction func save(_ sender: Any) {
        let cardItem = Card()
        let id = KeyStorage()
        cardItem.id = id.userId
        cardItem.title = cardName
        cardItem.category = category
        cardItem.discount = Int(sale) ?? 0
        cardItem.front_photo = frontPhoto
        cardItem.back_photo = rearImage
        
        card?.addCard(card: cardItem)
        id.userId += 1
        id.userDefault.synchronize()
        
        let realm = try! Realm()        
        realm.beginWrite()
        realm.add(cardItem.toRealm(), update: true)
        try! realm.commitWrite()
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let selectedImage : UIImage = info[UIImagePickerControllerEditedImage] as! UIImage
        myImageView.image = selectedImage
        rearImage = selectedImage
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
        navigationItem.title = cardName
        lblCategories.text = category?.title
        lblSale.text = sale
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
