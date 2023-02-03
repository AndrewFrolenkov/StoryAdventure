//
//  StackView.swift
//  ChooseYourOwnAdventure
//
//  Created by Андрей Фроленков on 2.02.23.
//

import UIKit

class StackView: UIStackView {
    
    let storylabel: UILabel = {
        let label = UILabel()
        label.text = "Story Text"
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .systemFont(ofSize: 25)
        return label
    }()
    
    let choice1Button: UIButton = {
        let button = UIButton()
        button.setTitle("Choise 1", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 23)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.setTitleColor( .white, for: .normal)
        button.setBackgroundImage(UIImage(named: "choice1Background"), for: .normal)
        button.addTarget(nil, action: #selector(ViewController.choiceMade), for: .touchUpInside)
        return button
    }()
    
    let choice2Button: UIButton = {
        let button = UIButton()
        button.setTitle("Choise 2", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 23)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.setTitleColor( .white, for: .normal)
        button.setBackgroundImage(UIImage(named: "choice2Background"), for: .normal)
        button.addTarget(nil, action: #selector(ViewController.choiceMade), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addArrangedSubview(storylabel)
        addArrangedSubview(choice1Button)
        addArrangedSubview(choice2Button)
        setConstraints()
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        spacing = 10
        
    }
    
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            choice1Button.heightAnchor.constraint(equalToConstant: 100),
            choice2Button.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
}
