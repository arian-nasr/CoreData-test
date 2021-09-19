//
//  Water+CoreDataProperties.swift
//  Waterminder
//
//  Created by Arian Nasr on 2021-09-18.
//
//

import Foundation
import CoreData


extension Water {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Water> {
        return NSFetchRequest<Water>(entityName: "Water")
    }

    @NSManaged public var quantity: Int64
    @NSManaged public var timestamp: Date?

}

extension Water : Identifiable {

}
