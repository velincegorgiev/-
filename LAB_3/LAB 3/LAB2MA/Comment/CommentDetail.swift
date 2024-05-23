//
//  FoodComment.swift
//  LAB2MA
//
//  Created by David Atanasoski on 16.9.23.
//

import Foundation


import UIKit
import CoreData

class CommentDetail: UIViewController{
    
    
    @IBOutlet weak var itemTF: UITextField!
    @IBOutlet weak var commentTV: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func saveActionButton(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Comment", in: context)
        let newCommnet = Comment(entity: entity!, insertInto: context)
        
        newCommnet.id = commentList.count as NSNumber
        newCommnet.item = itemTF.text
        newCommnet.comment = commentTV.text
        
        do {
            try context.save()
            commentList.append(newCommnet)
            navigationController?.popViewController(animated: true)
        }
        catch{
            print("context save error ")
        }
    }
    
}
