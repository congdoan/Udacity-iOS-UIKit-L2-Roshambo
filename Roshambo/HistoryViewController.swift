//
//  HistoryViewController.swift
//  Roshambo
//
//  Created by Cong Doan on 10/24/17.
//  Copyright © 2017 Cong Doan. All rights reserved.
//

import UIKit


// MARK: - HistoryViewController: UIViewController, UITableViewDataSource
class HistoryViewController: UIViewController, UITableViewDataSource {
    
    // MARK: Properties
    var history: [RPSMatch]!


    // MARK: - UITableViewDataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RPSMatchCell")!
        let match = history[indexPath.row]
        let title: String
        if let userWin = match.userWin {
            title = userWin ? "Win" : "Lose"
        } else {
            title = "Tie"
        }
        let imageName = title
        cell.imageView?.image = UIImage(named: imageName)
        cell.textLabel?.text = title
        cell.detailTextLabel?.text = "\(match.userChoice.rawValue) vs \(match.phoneChoice.rawValue)"
        return cell
    }


    // MARK: - Actions
    @IBAction func onDoneButtonPress(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
