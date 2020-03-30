//
//  One+CoreDataProperties.swift
//  OneToManyTest
//
//  Created by Tony Miller on 3/26/20.
//  Copyright © 2020 Fahrsoft. All rights reserved.
//
//

import Foundation
import CoreData


extension One {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<One> {
        return NSFetchRequest<One>(entityName: "One")
    }

    @NSManaged public var name: String?
    @NSManaged public var many: NSSet?

}

// MARK: Generated accessors for many
extension One {

    @objc(addManyObject:)
    @NSManaged public func addToMany(_ value: Many)

    @objc(removeManyObject:)
    @NSManaged public func removeFromMany(_ value: Many)

    @objc(addMany:)
    @NSManaged public func addToMany(_ values: NSSet)

    @objc(removeMany:)
    @NSManaged public func removeFromMany(_ values: NSSet)

}
