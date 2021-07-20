//
//  PlayerDitailViewController.swift
//  TableViewProjectPractice
//
//  Created by 伏谷亮弥 on 2021/07/21.
//

import UIKit

class PlayerDitailViewController: UIViewController {
    
    var player: Player? {
        didSet {
            playerImageView.image = player?.image
            nameLabel.text = player?.name
        }
    }
    
    var playerImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .blue
        iv.layer.cornerRadius = 10
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 35)
        label.textColor = .white
        label.text = "name name name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let generationTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Generation:"
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    
    let generationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 40)
        label.textAlignment = .right
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        view.backgroundColor = .white
       
        view.addSubview(playerImageView)
        view.addSubview(nameLabel)
        
        [
            playerImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            playerImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            playerImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            playerImageView.heightAnchor.constraint(equalToConstant: view.frame.width),
            
            nameLabel.rightAnchor.constraint(equalTo: playerImageView.rightAnchor, constant: -15),
            nameLabel.bottomAnchor.constraint(equalTo: playerImageView.bottomAnchor, constant: -15)
            
        ].forEach{ $0.isActive = true }
        
        let generationStackView = UIStackView(arrangedSubviews: [generationTitleLabel, generationLabel])
        
        generationStackView.axis = .horizontal
        generationStackView.spacing = 0
        generationStackView.distribution = .fillEqually
       
        generationStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(generationStackView)
        [
        generationStackView.topAnchor.constraint(equalTo: playerImageView.bottomAnchor, constant: 60),
        generationStackView.leftAnchor.constraint(equalTo: playerImageView.leftAnchor, constant: 10),
            generationStackView.rightAnchor.constraint(equalTo: playerImageView.rightAnchor, constant: -10)
        ].forEach{ $0.isActive = true}
}
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.title = "Detail"
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}
