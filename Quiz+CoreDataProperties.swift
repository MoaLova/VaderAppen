//
//  Quiz+CoreDataProperties.swift
//  VaderAppen
//
//  Created by Moa.Svensson on 2024-03-04.
//
//

import Foundation
import CoreData


extension Quiz {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Quiz> {
        return NSFetchRequest<Quiz>(entityName: "Quiz")
    }

    @NSManaged public var quizQuestion: String?
    @NSManaged public var quizAnswer: Bool

}

extension Quiz : Identifiable {

}
