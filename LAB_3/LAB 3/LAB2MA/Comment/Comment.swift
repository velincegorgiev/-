//
//  Comment.swift
//  LAB2MA
//
//  Created by David Atanasoski on 16.9.23.
//

import Foundation


import CoreData

@objc(Comment)
class Comment:NSManagedObject{
    
    @NSManaged var id: NSNumber!
    @NSManaged var comment:String!
    @NSManaged var deletedDate:Date?
    @NSManaged var item: String!
}
