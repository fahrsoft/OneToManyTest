//
//  Many+CoreDataProperties.swift
//  OneToManyTest
//
//  Created by Tony Miller on 3/26/20.
//  Copyright © 2020 Fahrsoft. All rights reserved.
//
//

import Foundation
import CoreData


extension Many {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Many> {
        return NSFetchRequest<Many>(entityName: "Many")
    }

    @NSManaged public var attribute: String?
    @NSManaged public var one: One?

}
