//
//  ViewController.swift
//  TriviaApp
//
//  Created by Kasun on 10/29/1399 AP.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "cricketers"
        {
            if nameField.text == ""{
                       let alert = UIAlertController(title: "", message: "Please enter name", preferredStyle: UIAlertController.Style.alert)
                       alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                       self.present(alert, animated: true, completion: nil)
            }else{
            let Detailedview = segue.destination as! CricketerNameViewController
            Detailedview.userName = nameField.text!
            self.nameField.text = ""
            Detailedview.modalPresentationStyle = .fullScreen
            }
        }else if segue.identifier == "allGames"{
            let Detailedview = segue.destination as! AllGamesViewController
            
            Detailedview.modalPresentationStyle = .fullScreen
        }
    }

   
    
}
