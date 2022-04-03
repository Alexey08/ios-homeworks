//
//  FeedViewController.swift
//  Navigation
//
//  Created by Алексей Уланов on 01.03.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    // создаем кнопку 1
    let oneButton: UIView = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("1", for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        return button
    }()

    // создаем кнопку 2
    let secondButton: UIView = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("2", for: .normal)
        button.backgroundColor = .systemRed
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        return button
    }()
    
    // создаем stackFeed
    let stackFeed: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 10.0
        return stack
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        title = "Feed"
                
        // наполняем stackFeed и добавляем на экран
        stackFeed.addArrangedSubview(oneButton)
        stackFeed.addArrangedSubview(secondButton)
        self.view.addSubview(stackFeed)
        
        // закрепляем stackFeed
        stackFeed.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        stackFeed.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        stackFeed.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        stackFeed.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor).isActive = true
    }
    
    @objc func tap() {
        let post = Post(title: "New Post!")
        let postVC = PostViewController()
        postVC.post = post

        self.navigationController?.pushViewController(postVC, animated: true)
    }
}
