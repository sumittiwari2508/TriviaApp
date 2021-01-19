//
//  AllDetailViewController.swift
//  TriviaApp
//
//  Created by Kasun on 10/29/1399 AP.
//

import UIKit
import CoreData

class AllDetailViewController: UIViewController {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var cricketerName: UILabel!
    @IBOutlet weak var finishBtn: UIButton!
    @IBOutlet weak var flagColors: UILabel!
    
    var username = String()
    var bestCricketerName = String()
    var flagColor = String()
    var context:NSManagedObjectContext!
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        self.userName.text = "Hello \(username)"
        self.cricketerName.text = "\(bestCricketerName)"
        self.flagColors.text = "\(flagColor)"
    }
    
    @IBAction func onClickFinish(_ sender: Any) {
        let dateTime = Date().string(format: "MMM d, h:mm a")
        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)// create new user and adding data in entity
     
        newUser.setValue(self.username, forKey: "name") // "name" is the entity attribute. here setting username value in "name" attribute
        newUser.setValue(self.bestCricketerName, forKey: "crickterName")
        newUser.setValue(self.flagColor, forKey: "nationalFlagColor")
        newUser.setValue(dateTime, forKey: "date")
        
        do {
           try context.save()// saving data in code database
            let alert = UIAlertController(title: "", message: "Data saved!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action in
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                
                for controller in self.navigationController!.viewControllers as Array {
                                if controller.isKind(of: ViewController.self) {
                                    _ =  self.navigationController!.popToViewController(controller, animated: true)
                                    break
                                }
                            }
//                nextViewController.modalPresentationStyle = .fullScreen
//                self.present(nextViewController, animated:true, completion:nil)
            }))
            self.present(alert, animated: true, completion: nil)
            
          } catch {
           print("Failed saving")
        }
    }
}

// for date/time format
extension Date {
    func string(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
