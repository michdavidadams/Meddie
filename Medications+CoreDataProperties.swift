//
//  Medications+CoreDataProperties.swift
//  Meddie
//
//  Created by Michael Adams on 7/29/20.
//  Copyright © 2020 Michael Adams. All rights reserved.
//
//

import Foundation
import CoreData


extension Medications: Identifiable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Medications> {
        return NSFetchRequest<Medications>(entityName: "Medication")
    }

    @NSManaged public var name: String
    @NSManaged public var selectedAmount: Int64
    @NSManaged public var dateTaken: Date
    @NSManaged public var timeTaken: Date
    
    
    

}
