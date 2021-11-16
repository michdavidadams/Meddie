//
//  MorningMedication+CoreDataProperties.swift
//  Meddie
//
//  Created by Michael Adams on 8/3/20.
//  Copyright © 2020 Michael Adams. All rights reserved.
//
//

import Foundation
import CoreData


extension MorningMedication: Identifiable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MorningMedication> {
        return NSFetchRequest<MorningMedication>(entityName: "MorningMedication")
    }

    @NSManaged public var timeToTake: Date
    @NSManaged public var name: String
    @NSManaged public var numberToTake: Int64
    @NSManaged public var lastTaken: Date

}
