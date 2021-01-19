//
//  AllGamesViewController.swift
//  TriviaApp
//
//  Created by Kasun on 10/29/1399 AP.
//

import UIKit
import CoreData

class AllGamesViewController: UIViewController {

    var context:NSManagedObjectContext!
    var arrayOfUsers = [NSManagedObject]()
    
   
    @IBOutlet weak var allGamesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "List Of Games"
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        self.allGamesTableView.dataSource = self
        self.allGamesTableView.delegate = self
        self.allGamesTableView.register(UINib (nibName: "GamesListTableViewCell", bundle: nil), forCellReuseIdentifier: "gameList")
        
        fetchData()
    }
    

    
    func fetchData(){
        self.arrayOfUsers.removeAll()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")// fetching data from code data using "User" entity
               
                request.returnsObjectsAsFaults = false
                do {
                    let result = try context.fetch(request)
                       
                    for data in result as! [NSManagedObject] {

                        self.arrayOfUsers.append(data)
                  }
                    
                    
                } catch {
                    
                    print("Failed")
                }
    }

    
    
    
}

extension AllGamesViewController: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.arrayOfUsers.count > 0{
        return self.arrayOfUsers.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:GamesListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "gameList", for: indexPath) as!GamesListTableViewCell
        cell.contentView.layer.borderWidth = 1
        cell.contentView.layer.borderColor = UIColor.lightGray.cgColor
        
        let userDict = self.arrayOfUsers[indexPath.row]
        // adding array values in cell using core data attribute
        cell.name.text = "Name: \(userDict.value(forKey: "name") as! String)"
        
        cell.dateTime.text = userDict.value(forKey: "date") as? String
        cell.bestcricketerName.text = userDict.value(forKey: "crickterName") as? String
        cell.flagColors.text = userDict.value(forKey: "nationalFlagColor") as? String
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 155
    }
}
