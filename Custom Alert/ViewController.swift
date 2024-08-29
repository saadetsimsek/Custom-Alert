//
//  ViewController.swift
//  Custom Alert
//
//  Created by Saadet Şimşek on 28/08/2024.
//

import UIKit

class ViewController: UIViewController {
    
    let customAlert = MyAlert()
    
    let myButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.backgroundColor = .purple
        button.setTitle("Show Alert", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(myButton)
        addConstraits()
        
        myButton.addTarget(self,
                           action: #selector(didButtonTap),
                           for: .touchUpInside)
    }
    
    @objc private func didButtonTap(){
        
        customAlert.showAlert(title: "Like",
                              message: "SWIFT By Newbie to Newbie",
                              viewController: self)
    }

    private func addConstraits(){
        NSLayoutConstraint.activate([
            myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            myButton.heightAnchor.constraint(equalToConstant: 70),
            myButton.widthAnchor.constraint(equalToConstant: 300),
        ])
    }

}

