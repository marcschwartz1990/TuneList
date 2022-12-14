//
//  Song+CoreDataProperties.swift
//  TuneList
//
//  Created by Marc-Developer on 9/26/22.
//
//

import Foundation
import CoreData


extension Song {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Song> {
        return NSFetchRequest<Song>(entityName: "Song")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var key: String?
    @NSManaged public var style: String?
    @NSManaged public var title: String?
    @NSManaged public var composer: String?
    @NSManaged public var yearComposed: String?
    @NSManaged public var lyricist: String?
    @NSManaged public var form: String?
    @NSManaged public var notes: String?
    
    var wrappedKey: String {
        key ?? "Key Unknown"
    }
    
    var wrappedStyle: String {
        style ?? "Style Unknown"
    }
    
    var wrappedTitle: String {
        title ?? "Title Unknown"
    }
    
    var wrappedComposer: String {
        composer ?? ""
    }
    
    var wrappedYearComposed: String {
        yearComposed ?? ""
    }
    
    var wrappedLyricist: String {
        lyricist ?? ""
    }
    
    var wrappedForm: String {
        form ?? ""
    }
    
    var wrappedNotes: String {
        notes ?? ""
    }

}

extension Song : Identifiable {

}
