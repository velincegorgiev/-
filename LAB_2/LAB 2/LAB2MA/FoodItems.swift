//
//  FoodItems.swift
//  LAB2MA
//
//  Created by David Atanasoski on 15.9.23.
//

import UIKit



class FoodViewItems: UIViewController, UITableViewDataSource, UITableViewDelegate
    
{
  
    
    @IBOutlet weak var foodTableView: UITableView!
    var foodItems = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialization code
        initList()
    }

 



    func initList(){
        let salad = Item(name: "Caesar salad", img:  "salat", desc: "Cesar salad: romaine, croutons, lemony dressing with anchovies and Parmesan")
        foodItems.append(salad)
        let dish = Item(name: "Lasagna", img:  "lasagna", desc: "Lasagna: flat pasta layered with sauce, meats, and cheese.")
        foodItems.append(dish)
        let cake = Item(name: "Trileçe", img:  "cake", desc: "Trileçe, a sweet treat gaining popularity, features sponge cake soaked in three types of condensed milk—a variation of the Spanish 'Tres Leches' cake.")
        foodItems.append(cake)
    }

        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "FoodViewItems"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TableViewCell
        
        let foodItem = foodItems[indexPath.row]
        
        cell.foodName.text = foodItem.name
        cell.foodImage.image =  UIImage(named: foodItem.img)
        cell.foodDescription.text = foodItem.desc

        
        return cell
    }
    
    
}
