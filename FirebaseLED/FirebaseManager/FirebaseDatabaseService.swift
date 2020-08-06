//
//  FirebaseDatabase.swift
//  FirebaseLED
//
//  Created by EricM on 8/6/20.
//  Copyright © 2020 EricM. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

class DatabaseService: DatabaseReference {
    static let manager = DatabaseService()
    
    var refer = Database.database().reference().child("Status")
    

//    func test() -> Bool{
//        let data = refer.child("Status").observe(.value) { (snap: DataSnapshot) in
//            //print("\(snap.value!)")
//            if snap.value! == true {
//                return true
//            }
//            else { return false}
//        }
//
//        return data
//    }
}
