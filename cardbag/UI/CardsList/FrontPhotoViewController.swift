//
//  FrontPhotoViewController.swift
//  CardBag
//
//  Created by Admin on 24.10.2018.
//  Copyright © 2018 arcMi. All rights reserved.
//

import UIKit

class FrontPhotoViewController: UIViewController, CardIOViewDelegate {
    func cardIOView(_ cardIOView: CardIOView!, didScanCard cardInfo: CardIOCreditCardInfo!) {
        
    }
    
//    func userDidCancel(_ paymentViewController: CardIOPaymentViewController!) {
//        lbl.text = "user canceled"
//        paymentViewController?.dismiss(animated: true, completion: nil)
//    }
//
//    func userDidProvide(_ cardInfo: CardIOCreditCardInfo!, in paymentViewController: CardIOPaymentViewController!) {
//        if let info = cardInfo {
//            let str = NSString(format: "Received card info.\n Number: %@\n expiry: %02lu/%lu\n cvv: %@.", info.redactedCardNumber, info.expiryMonth, info.expiryYear, info.cvv)
//            lbl.text = str as String
//        }
//        paymentViewController?.dismiss(animated: true, completion: nil)
//    }
    
    
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnPhoto: UIButton!
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var lblCategories: UILabel!
    @IBOutlet weak var lblSale: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnNext.setTitle("ДАЛЕЕ", for: .normal)
        lblCategories.layer.cornerRadius = 12
        lblSale.layer.cornerRadius = 12
        btnNext.layer.cornerRadius = 24
        
        lbl.text = "Лицевая сторона"
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "Спортмастер"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onChangeBtn(_ sender: Any) {
        nextPage()
    }
    
    @IBAction func makePhoto(_ sender: Any) {
        let cardIOVC = CardIOView(frame: view.frame)
        cardIOVC.delegate = self
        var makePhoto = UIViewController()
        makePhoto.view = cardIOVC
        present(makePhoto, animated: true, completion: nil)
    }
    
    func nextPage() {
        let next = RearPhotoViewController()
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
