//
//  DrinkViewDetail.swift
//  LAB2MA
//
//  Created by David Atanasoski on 16.9.23.
//

import Foundation

import UIKit

class DrinkViewDetail:UIViewController{
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var desc: UILabel!
    
    var selected:Item!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialization code
        
        name.text = selected.name
        img.image = UIImage(named: selected.img)
        desc.text = selected.desc
    }
}
