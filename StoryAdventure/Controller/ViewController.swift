//
//  ViewController.swift
//  StoryAdventure
//
//  Created by Андрей Фроленков on 2.02.23.
//

import UIKit

class ViewController: UIViewController {
    
    let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "background")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let stackView: StackView = {
        let stackView = StackView(frame: .zero)
        return stackView
    }()
    
    var stories = StoryBrain()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addAllSubview()
        setAllConstraints()
        updateUI()
        
    }
    
    @objc func choiceMade(sender: UIButton) {
        
        sender.layer.opacity = 0.5
        
        guard let label = sender.titleLabel, let userAnswer = label.text else { return }
        stories.checkAnswer(answer: userAnswer)
        stories.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI() {
        
        let story = stories.getQuestionText()
        stackView.storylabel.text = story.title
        stackView.choice1Button.setTitle(story.choice1, for: .normal)
        stackView.choice2Button.setTitle(story.choice2, for: .normal)
        stackView.choice1Button.layer.opacity = 1
        stackView.choice2Button.layer.opacity = 1
    }


    private func addAllSubview() {
        
        self.view.addSubview(backgroundImage)
        self.view.addSubview(stackView)
    }
    
    private func setAllConstraints() {
        
        // backgroundImage
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        // stackView
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    
}

