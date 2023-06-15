//
//  LinkModel.swift
//  language
//
//  Created by Mikhail Chudaev on 15.06.2023.
//

import Foundation
import RealmSwift

class LinkModel: Object, Identifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    
    @Persisted var link: String = ""
    @Persisted var linkName: String = ""
    
    override class func primaryKey() -> String? {
        "id"
    }
}
