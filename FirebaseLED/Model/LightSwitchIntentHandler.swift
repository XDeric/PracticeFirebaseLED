//
//  LightSwitchIntentHandler.swift
//  FirebaseLED
//
//  Created by EricM on 10/13/20.
//  Copyright © 2020 EricM. All rights reserved.
//

import Foundation

class LightSwitchIntentHandler: NSObject, LightSwitchIntentHandling {
    
    func confirm(intent: LightSwitchIntent, completion: @escaping (LightSwitchIntentResponse) -> Void) {
        let viewCont = ViewController()
        
        //So here I am accesing re(RTDB reference) looking at the value(Int) to see if its on or not
        viewCont.re.observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? Int
            
            //I'm checking if there is value
            if let value = value {
                if value == 0 || value == 1 {
                    completion(LightSwitchIntentResponse(code: .ready, userActivity: nil))
                }
                else {
                    completion(LightSwitchIntentResponse(code: .failure, userActivity: nil))
                }
            }
        }){ (error) in
            print(error.localizedDescription)
        }
    }
    
    func handle(intent: LightSwitchIntent, completion: @escaping (LightSwitchIntentResponse) -> Void) {
        let viewCont = ViewController()
        
        viewCont.re.observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? Int
            
            if let value = value {
                completion(LightSwitchIntentResponse(code: .success, userActivity: nil))
            }
        })
        
    }
    
    func resolveState(for intent: LightSwitchIntent, with completion: @escaping (StateResolutionResult) -> Void) {

    }
}
