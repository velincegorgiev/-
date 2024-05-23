//
//  FoodViewDetail.swift
//  LAB2MA
//
//  Created by David Atanasoski on 16.9.23.
//

import Foundation

import UIKit

class FoodViewDetail:UIViewController{
    
    @IBOutlet weak var foodName: UILabel!
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodDesc: UILabel!
    
    
    var selectedFood:Item!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialization code
        
        foodName.text = selectedFood.name
        foodImage.image = UIImage(named: selectedFood.img)
        foodDesc.text = selectedFood.desc
    }
}
