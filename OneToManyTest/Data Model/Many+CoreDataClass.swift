//
//  Many+CoreDataClass.swift
//  OneToManyTest
//
//  Created by Tony Miller on 3/26/20.
//  Copyright © 2020 Fahrsoft. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Many)
public class Many: NSManagedObject {
    public var wrappedAttribute: String {
        attribute ?? "Unknown attribute"
    }
}

extension Many: Comparable {
    public static func < (lhs: Many, rhs: Many) -> Bool {
        lhs.wrappedAttribute < rhs.wrappedAttribute
    }
}
