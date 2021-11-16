//
//  EveningMedication+CoreDataProperties.swift
//  Meddie
//
//  Created by Michael Adams on 8/3/20.
//  Copyright © 2020 Michael Adams. All rights reserved.
//
//

import Foundation
import CoreData


extension EveningMedication: Identifiable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EveningMedication> {
        return NSFetchRequest<EveningMedication>(entityName: "EveningMedication")
    }

    @NSManaged public var timeToTake: Date
    @NSManaged public var name: String
    @NSManaged public var numberToTake: Int64
    @NSManaged public var lastTaken: Date
    
}
