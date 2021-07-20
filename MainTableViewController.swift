//
//  MainTableViewController.swift
//  TableViewProjectPractice
//
//  Created by 伏谷亮弥 on 2021/07/20.
//
import UIKit

class Player {
    let name: String
    let image: UIImage
    
    init(name: String, image: UIImage) {
        self.name = name
        self.image = image
    }
}

class MainTableViewController: UITableViewController {
    
    private let cellId = "cellId"
    private let players: [[Player]] = [
        [.init(name: "James Harden", image: #imageLiteral(resourceName: "james_harden")),
         .init(name: "Stephen Curry", image: #imageLiteral(resourceName: "vince_carter")),
         .init(name: "Lebron James", image: #imageLiteral(resourceName: "lebron_james")),
         .init(name: "Kylie Irving", image: #imageLiteral(resourceName: "kylie_ irving")),
         .init(name: "Luka Doncic", image: #imageLiteral(resourceName: "luka_doncic"))],
        
        [.init(name: "James Harden", image: #imageLiteral(resourceName: "james_harden")),
         .init(name: "Stephen Curry", image: #imageLiteral(resourceName: "vince_carter")),
         .init(name: "Lebron James", image: #imageLiteral(resourceName: "lebron_james")),
         .init(name: "Kylie Irving", image: #imageLiteral(resourceName: "kylie_ irving")),
         .init(name: "Luka Doncic", image: #imageLiteral(resourceName: "luka_doncic"))],
        
        [.init(name: "James Harden", image: #imageLiteral(resourceName: "james_harden")),
         .init(name: "Stephen Curry", image: #imageLiteral(resourceName: "vince_carter")),
         .init(name: "Lebron James", image: #imageLiteral(resourceName: "lebron_james")),
         .init(name: "Kylie Irving", image: #imageLiteral(resourceName: "kylie_ irving")),
         .init(name: "Luka Doncic", image: #imageLiteral(resourceName: "luka_doncic"))],
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: cellId)
        setupNavigationBar()
        
        
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "NBA Player"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // navigationbarの背景色を変更
        let apperance = UINavigationBarAppearance()
        apperance.configureWithDefaultBackground()
        apperance.backgroundColor = UIColor(white: 0.9, alpha: 1)
        navigationController?.navigationBar.scrollEdgeAppearance = apperance
        navigationController?.navigationBar.standardAppearance = apperance
    }
    
    
}

// MARK: - tableViewの設定をしてます

extension MainTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return players.count
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "1990s"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        label.backgroundColor = .gray
        label.textColor = .white
        
        switch section {
        case 0:
            label.text = "1990s"
        case 1:
            label.text = "2000s"
        case 2:
            label.text = "2010s"
        default:
            break
        }
        
        
        return  label
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
    UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as!
            MainTableViewCell
        
        let player = players[indexPath.section][indexPath.row]
        cell.nameLabel.text =  player.name
        cell.playerImageView.image = player.image
        

        return cell
    }
}

