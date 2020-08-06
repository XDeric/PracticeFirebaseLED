//
//  ViewController.swift
//  FirebaseLED
//
//  Created by EricM on 7/23/20.
//  Copyright © 2020 EricM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var button: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        btn.addTarget(self, action: #selector(onOrOff), for: .touchUpInside)
        btn.setTitle("ON", for: .normal)
        return btn
    }()
    
    
    @objc func onOrOff(){
        button.setTitle("OFF", for: .normal)
    }
    
    func setupConstraints(){
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addSubview(view)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        // Do any additional setup after loading the view.
    }

}

