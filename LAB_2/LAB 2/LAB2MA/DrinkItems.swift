//
//  DrinkItems.swift
//  LAB2MA
//
//  Created by David Atanasoski on 15.9.23.
//


import UIKit

class DrinkViewItems: UIViewController, UITableViewDataSource, UITableViewDelegate

{
  
    
    @IBOutlet weak var drinkTableView: UITableView!
    var items = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialization code
        initList()
    }

 



    func initList(){
        let whiskey = Item(name: "Whiskey", img:  "whiskey", desc: "Whisky, a globally regulated spirit, encompasses various classes and types united by grain fermentation, distillation, and aging in wooden barrels.")
        items.append(whiskey)
        let mohito = Item(name: "Mohito", img:  "mohito", desc: "Mojito is a traditional Cuban punch. The cocktail often consists of five ingredients: white rum, sugar (traditionally sugar cane juice), lime juice, soda water, and mint.")
        items.append(mohito)
        let wine = Item(name: "Wine", img:  "wine", desc: "Wine is an alcoholic drink made from fermented fruit. Yeast consumes the sugar in the fruit and converts it to ethanol and carbon dioxide, releasing heat in the process.")
        items.append(wine)
    }

        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "DrinkViewItems"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TableViewCellDrinks
        
        let foodItem = items[indexPath.row]
        
        cell.name.text = foodItem.name
        cell.img.image =  UIImage(named: foodItem.img)
        cell.desc.text = foodItem.desc

        
        return cell
    }
    
    
}
