//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Ifang Lee on 11/18/21.
//

import SwiftUI
import CoreData
/**
 @ViewBuilder lets our containing view (whatever is using the list) send in multiple views, and our list will create an implicit HStack just like the regular List.
 @escaping says the closure will be stored away and used later, which means Swift needs to take care of its memory.
 */
struct FilteredList<T: NSManagedObject, Content: View>: View {
    var fetchRequest: FetchRequest<T>
    var singers: FetchedResults<T> { fetchRequest.wrappedValue }

    // this is our content closure; we'll call this once for each item in the list
    let content: (T) -> Content

    var body: some View {
        List(fetchRequest.wrappedValue, id:\.self) { singer in
            self.content(singer)
        }
    }
    
    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
        self.content = content
    }
}
