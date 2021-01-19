//
//  CricketerNameViewController.swift
//  TriviaApp
//
//  Created by Kasun on 10/29/1399 AP.
//

import UIKit

class CricketerNameViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
   
    

    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var cricketerNameTableView: UITableView!
    var cricketerName = String()
    var cricketernameArr = ["Sachin Tendulkar","Virat Kohli","Adam Gilchirst","Jacques Kallis"]
    var index = [Int]()
    var userName = String()
    override func viewDidLoad() {
        super.viewDidLoad()

        cricketerNameTableView.delegate = self
        cricketerNameTableView.dataSource = self
        
        cricketerNameTableView.register(UINib(nibName: "CricketerNameTableViewCell", bundle: nil), forCellReuseIdentifier: "cricketer")

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cricketernameArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "cricketer"
        let  cell = (tableView.dequeueReusableCell(withIdentifier: identifier) as? CricketerNameTableViewCell)!
        let dict = cricketernameArr[indexPath.row]
        cell.cricketerName.text = dict
        if index.contains(indexPath.row){ // if index value == indexPath.row then it will display selected value 
            cell.checkbox.image = UIImage(named: "Select")
        }else{
            cell.checkbox.image = UIImage(named: "Deselect")
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if index.count != 0{ // if selected index != 0 then it will remove previous value and add next selected value
            
            index.removeAll()
            index.append(indexPath.row)
            self.cricketerNameTableView.reloadData()
        }else{
            index.append(indexPath.row)
            self.cricketerNameTableView.reloadData()
        }
      
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "colors"
        {
            if index.count == 0{
                let alert = UIAlertController(title: "", message: "Please select cricketer name", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }else{
                cricketerName = String()
            let Detailedview = segue.destination as! FlagColorsViewController
            Detailedview.Name = userName
                for (index, element) in cricketernameArr.enumerated() { // using enumerated() to get name and position
                    if [index] == self.index{
                        cricketerName = element
                    }
                }
            Detailedview.cricketerName = cricketerName
            Detailedview.modalPresentationStyle = .fullScreen
            }
        }
    }
    
   
}
