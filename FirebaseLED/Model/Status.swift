//
//  Status.swift
//  FirebaseLED
//
//  Created by EricM on 8/6/20.
//  Copyright © 2020 EricM. All rights reserved.
//

import Foundation

struct Status: FirebaseConvertible {
    let id: UUID
    let status: String
    let statusNum: Bool
}

protocol FirebaseConvertible: Codable {
    func fieldsDict() -> [String: Any]
    init?(fromFirebaseDict dict: [String: Any])
}

extension FirebaseConvertible {
    init?(fromFirebaseDict dict: [String: Any]) {
        do {
            let data = try JSONSerialization.data(withJSONObject: dict)
            let object = try JSONDecoder().decode(Self.self, from: data)
            self = object
        } catch {
            return nil
        }
    }
    func fieldsDict() -> [String: Any] {
        return try! JSONSerialization.jsonObject(with: JSONEncoder().encode(self)) as! [String: Any]
    }
}
