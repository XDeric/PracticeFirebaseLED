//
//  FirebaseService.swift
//  FirebaseLED
//
//  Created by EricM on 8/6/20.
//  Copyright © 2020 EricM. All rights reserved.
//

import Foundation
import FirebaseFirestore

enum FirebaseError {
    case error
    case noChange
    case snapshotError
    
}

class FirebaseService {
    static let manager = FirebaseService()
    
    private let db = Firestore.firestore()
    
    
    func sendStatus(status: Status){
        db.collection("Status").document(status.id.uuidString).setData(status.fieldsDict())
    }
    
    func recieveStatus(){
    }
}
