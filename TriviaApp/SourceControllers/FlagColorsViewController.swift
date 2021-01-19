//
//  FlagColorsViewController.swift
//  TriviaApp
//
//  Created by Kasun on 10/29/1399 AP.
//

import UIKit

class FlagColorsViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    var flagColorArray = ["White","Yellow","Orange","Green"]
    
    
    @IBOutlet weak var flagColorTableView: UITableView!
    var index = [Int]()
    var cricketerName = String()
    var Name = String()
    var flagColor = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        flagColorTableView.delegate = self
        flagColorTableView.dataSource = self
        
        flagColorTableView.register(UINib(nibName: "FlagColorsTableViewCell", bundle: nil), forCellReuseIdentifier: "flagColor")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flagColorArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "flagColor"
        let  cell = (tableView.dequeueReusableCell(withIdentifier: identifier) as? FlagColorsTableViewCell)!
        let dict = flagColorArray[indexPath.row]
        cell.flagColor.text = dict
        
        if index.contains(indexPath.row){
            cell.checkbox.image = UIImage(named: "Select")
        }else{
            cell.checkbox.image = UIImage(named: "Deselect")
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if index.contains(indexPath.row){ // checking is index array contains selected value then removing selected value otherwise adding selected value in array
            
            let deleteIndexValue = index.firstIndex(of: indexPath.row)
            
            self.index.remove(at: deleteIndexValue!)
        }else{
            index.append(indexPath.row)
        }
       
        self.flagColorTableView.reloadData()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AllDetails"
        {
            if index.count == 0{
                let alert = UIAlertController(title: "", message: "Please select flag colors", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }else{
                flagColor = String()
                let Detailedview = segue.destination as! AllDetailViewController
                var i = 0
                for (index, element) in flagColorArray.enumerated() {//looping flagColorArray and checking index value with selected index value if both are equal then accessing comma seperated value
                    
                    for id in self.index{
                        if index == id{
                            if i == 0{
                                flagColor = flagColor + element
                            }else{
                                flagColor = flagColor + "," + element
                            }
                            i = i + 1
                        }
                    }
                }
               
                Detailedview.username = Name
                Detailedview.bestCricketerName = cricketerName
                Detailedview.flagColor = flagColor
                Detailedview.modalPresentationStyle = .fullScreen
            }
        }
    }
    
    
    
}
