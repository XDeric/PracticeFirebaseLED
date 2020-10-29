//
////
////  ViewController.swift
////  FirebaseLED
////
////  Created by EricM on 7/23/20.
////  Copyright © 2020 EricM. All rights reserved.
////
//
//import UIKit
//import FirebaseDatabase
//import Intents
//
//class ViewController: UIViewController {
//    
//    let re = DatabaseService.manager.refer
//    
//    lazy var button: UIButton = {
//        let btn = UIButton()
//        btn.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
//        btn.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
//        btn.addTarget(self, action: #selector(onOrOff), for: .touchUpInside)
//        btn.setTitle("OFF", for: .normal)
//        return btn
//    }()
//    
//    /// changes title on button and then sends int to firebase RTDB
//    @objc func onOrOff(){
//        //this listens to status in RTDB and the data is ANY
//        //        re.observe(.value) { (snap: DataSnapshot) in
//        //            //print(snap.value!)
//        //            let data = "\(snap.value!)"
//        //            if data == "true" {
//        //                self.button.setTitle("ON", for: .normal)
//        //
//        //            }
//        //            else {
//        //                self.button.setTitle("OFF", for: .normal)
//        //            }
//        //
//        //        }
//        if button.titleLabel?.text == "ON" {
//            button.setTitle("OFF", for: .normal)
//            re.setValue(0)
//            
//        }
//        else if button.titleLabel?.text == "OFF"{
//            button.setTitle("ON", for: .normal)
//            re.setValue(1)
//        }
//        
//    }
//    
//    //handle interaction of app with siri
//    func donateInteraction(){
//        let intent = LightSwitchIntent()
//        intent.suggestedInvocationPhrase = "On"
//        intent.suggestedInvocationPhrase = "Off"
//        
//        let interaction = INInteraction(intent: intent, response: nil)
//        
//        interaction.donate { (error) in
//            if error != nil {
//                if let error = error as NSError? {
//                    os_log("Interaction donation failed: %@", log: OSLog.default, type: .error, error)
//                } else {
//                    os_log("Successfully donated interaction")
//                }
//            }
//        }
//    }
//    
//    
//    func setupConstraints(){
//        button.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(button)
//        
//        NSLayoutConstraint.activate([
//            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            button.widthAnchor.constraint(equalToConstant: 150),
//            button.heightAnchor.constraint(equalToConstant: 50)
//        ])
//        
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = #colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 1)
//        setupConstraints()
//        donateInteraction()
//        // Do any additional setup after loading the view.
//    }
//    
//}
//
