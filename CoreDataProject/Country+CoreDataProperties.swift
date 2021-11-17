//
//  Country+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Ifang Lee on 11/16/21.
//
//

import Foundation
import CoreData


extension Country {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Country> {
        return NSFetchRequest<Country>(entityName: "Country")
    }

    @NSManaged public var fullName: String?
    @NSManaged public var shortName: String?
    @NSManaged public var candy: NSSet? // NSSet can contain anything, not restrict to cnady and thus not compatible with swiftUI set, cannot use at ForEach

    public var wrappedFullName: String {
        fullName ?? "Unknown Country"
    }

    public var wrappedShortName: String {
        shortName ?? "Unknown Country"
    }

    public var candyArray: [Candy] {
        let set = candy as? Set<Candy> ?? []
        return set.sorted { //sorting a set automatically returns an array, and array can be used at ForEach
            $0.wrappedName < $1.wrappedName
        }
    }
}

// MARK: Generated accessors for candy
extension Country {

    @objc(addCandyObject:)
    @NSManaged public func addToCandy(_ value: Candy)

    @objc(removeCandyObject:)
    @NSManaged public func removeFromCandy(_ value: Candy)

    @objc(addCandy:)
    @NSManaged public func addToCandy(_ values: NSSet)

    @objc(removeCandy:)
    @NSManaged public func removeFromCandy(_ values: NSSet)

}

extension Country : Identifiable {

}
