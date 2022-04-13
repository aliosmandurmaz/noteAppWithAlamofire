//
//  NotDetayViewController.swift
//  NotUygulamasi
//
//  Created by Ali Osman DURMAZ on 18.03.2022.
//

import UIKit
import Alamofire

class NotDetayViewController: UIViewController {

    @IBOutlet weak var textFieldDersAdi: UITextField!;
    
    @IBOutlet weak var textFieldNot1: UITextField!;
    
    @IBOutlet weak var textFieldNot2: UITextField!;
    
    var not:Notlar?;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let n = not {
            textFieldDersAdi.text = n.ders_adi;
            textFieldNot1.text = n.not1;
            textFieldNot2.text = n.not2;
        }

    }
    
    @IBAction func notSil(_ sender: Any) {
        
        if let n = not {
            
            if let nid = Int(n.not_id!) {
                sil(not_id: nid)
            }
        }
    }
    
    
    @IBAction func notGuncelle(_ sender: Any) {
        
        if let n = not , let ad = textFieldDersAdi.text , let not1 = textFieldNot1.text , let not2 = textFieldNot2.text {
            
            if let nid = Int(n.not_id!), let n1 = Int(not1) , let n2 = Int(not2) {
                guncelle(not_id: nid, ders_adi: ad, not1: n1, not2: n2);
            }
            
        }
        
    }
    
    func sil(not_id:Int) {
        
        let parametreler:Parameters = ["not_id":not_id];
        
        Alamofire.request("http://aodurmaz.xyz/notlar/delete_not.php",method: .post,parameters: parametreler).responseJSON {
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
    
    func guncelle(not_id:Int,ders_adi:String,not1:Int,not2:Int) {
        
        let parametreler:Parameters = ["not_id":not_id,"ders_adi":ders_adi,"not1":not1,"not2":not2];
        
        Alamofire.request("http://aodurmaz.xyz/notlar/update_not.php",method: .post,parameters: parametreler).responseJSON {
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

