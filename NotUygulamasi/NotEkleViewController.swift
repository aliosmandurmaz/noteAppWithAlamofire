//
//  NotEkleViewController.swift
//  NotUygulamasi
//
//  Created by Ali Osman DURMAZ on 18.03.2022.
//

import UIKit
import Alamofire

class NotEkleViewController: UIViewController {

    @IBOutlet weak var textFieldDersAdi: UITextField!;
    
    @IBOutlet weak var textFieldNot1: UITextField!;
    
    @IBOutlet weak var textFieldNot2: UITextField!;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func buttonEkle(_ sender: Any) {
        if let ad = textFieldDersAdi.text , let not1 = textFieldNot1.text , let not2 = textFieldNot2.text {
            
            if let n1 = Int(not1) , let n2 = Int(not2) {
                notEkle(ders_adi: ad, not1: n1, not2: n2);
            }
            
        }
        
    }
    
    func notEkle(ders_adi:String,not1:Int,not2:Int) {
        
        let parametreler:Parameters = ["ders_adi":ders_adi,"not1":not1,"not2":not2];
        
        Alamofire.request("http://aodurmaz.xyz/notlar/insert_not.php",method: .post,parameters: parametreler).responseJSON {
            response in
            if let data = response.data {
                
                do {
                    
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        print(json);
                    }
               
                } catch  {
                    print(error.localizedDescription);
                }
                
            }
        }
        
    }

}
