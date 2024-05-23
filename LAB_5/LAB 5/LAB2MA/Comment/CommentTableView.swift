//
//  CommentTableView.swift
//  LAB2MA
//
//  Created by David Atanasoski on 16.9.23.
//

import Foundation
import UIKit
import CoreData

var commentList = [Comment]()

class CommentTableView: UITableViewController{
    
    var firstLoad = true
    
    override func viewDidLoad()
        {
            if(firstLoad)
            {
                firstLoad = false
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
                let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Comment")
                do {
                    let results:NSArray = try context.fetch(request) as NSArray
                    for result in results
                    {
                        let comment = result as! Comment
                        commentList.append(comment)
                    }
                }
                catch
                {
                    print("Fetch Failed")
                }
            }
        }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let commentCell = tableView.dequeueReusableCell(withIdentifier: "commentCellID",for: indexPath) as! CommentCell
        
        let thisNote: Comment!
        thisNote = commentList[indexPath.row]
                
        commentCell.item.text = thisNote.item
        commentCell.comment.text = thisNote.comment
        
        return commentCell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        {
            return commentList.count
        }
    
    
    override func viewDidAppear(_ animated: Bool)
    {
        tableView.reloadData()
    }
}
