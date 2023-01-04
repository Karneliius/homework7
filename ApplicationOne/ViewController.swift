//
//  ViewController.swift
//  ApplicationOne
//
//  Created by Anelya Kabyltayeva on 19.12.2022.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    
    private lazy var myLabel:  UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "I am Rich "
        return label
    }()
    private lazy var myDiamond: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage (named: "diamond")
        return imageView
    } ()
    
    private lazy var myLabelTwo:  UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .white
        label.text = "I can buy anything "
        return label
    }()
    
    private lazy var myLabelThree:  UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 23)
        label.textColor = .white
        label.text = "Account: "
        return label
    }()
    private lazy var myLabelFour:  UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 23)
        label.textColor = .white
        label.text = "0.0$"
        return label
    }()
    private lazy var myButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .lightGray
        button.setTitle("Change", for: .normal)
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 10
        button.addTarget (self, action: #selector(didPressButton), for: .touchUpInside)
        return button
    }()
    /*@IBAction func randomNumber(_ sender: UIButton) {
    Button.text = String (arc4random_uniform(9999))
            print("Button tapped!")
        }
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(red: 13/255, green: 71/255, blue:21/255, alpha:1)
        setupViews()
        setupConstraints()
    }
    @objc func didPressButton(sender: UIButton!) {
        myLabelFour.text = "\(Int.random(in: 1000..<10000))$"
        }
    }
// MARK: - Setup views and constraints method

private extension ViewController {
    func setupViews (){
        view.addSubview(myLabel)
        view.addSubview(myDiamond)
        view.addSubview(myLabelTwo)
        view.addSubview(myLabelThree)
        view.addSubview(myLabelFour)
        view.addSubview(myButton)
        
    }
    
    func setupConstraints (){
        myLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(myDiamond.snp.top)
        }
        myDiamond.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(300)
        }
        myLabelTwo.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(myDiamond.snp.bottom)
        }
        myLabelThree.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(100)
            make.top.equalTo(myLabelTwo.snp.bottom).offset(30)
        }
        myLabelFour.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalTo(myLabelThree.snp.left).offset(100)
            make.right.equalToSuperview().offset(20)
            make.top.equalTo(myLabelTwo.snp.bottom).offset(30)
        }
        myButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(myLabelTwo.snp.bottom).offset(100)
            make.width.equalToSuperview().dividedBy(4)
            make.height.equalToSuperview().dividedBy(20)
        
        }
    }
}


