//
//  One+CoreDataClass.swift
//  OneToManyTest
//
//  Created by Tony Miller on 3/26/20.
//  Copyright © 2020 Fahrsoft. All rights reserved.
//
//

import Foundation
import CoreData

@objc(One)
public class One: NSManagedObject {
    public var wrappedName: String {
        name ?? "Unknown name"
    }
    
    public var manyArray: [Many] {
        let set = many as? Set<Many> ?? []
        return set.sorted()
    }
}
