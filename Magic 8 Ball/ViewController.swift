//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Angela Yu on 14/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let label = UILabel()
    let imageView = UIImageView()
    let button = UIButton()
    
    let ballArray = ["ball1", "ball2", "ball3", "ball4", "ball5"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupView()
    }

    func setupView() {
        view.backgroundColor = hexStringToUIColor(hex: "#6482AD")
        
        //Label
        label.text = "Ask Me Anything..."
        label.font = UIFont.systemFont(ofSize: 40, weight: .regular)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        //ImageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        //Button
        button.setTitle("Ask", for: .normal)
        button.setTitleColor(hexStringToUIColor(hex: "#6482AD"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        button.layer.cornerRadius = 12
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            //Label
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //ImageView
            imageView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 70),
            imageView.centerXAnchor.constraint(equalTo: label.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 280),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            
            //Button
            button.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 60),
            button.widthAnchor.constraint(equalToConstant: 80),
        ])
        
    }
    
    @objc func buttonPressed() {
        guard let randomImage = ballArray.randomElement() else {
            return
        }
        imageView.image = UIImage(named: randomImage)
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

