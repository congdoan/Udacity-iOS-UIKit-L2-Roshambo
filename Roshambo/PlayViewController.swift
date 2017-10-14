//
//  MainViewController.swift
//  Roshambo
//
//  Created by Cong Doan on 10/13/17.
//  Copyright © 2017 Cong Doan. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController, ResultViewControllerDelegate {
    
    // MARK: - Variables
    var wins = 0
    var ties = 0
    var loses = 0
    
    // MARK: - Outlets
    @IBOutlet weak var totalTimesLabel: UILabel!
    @IBOutlet weak var winsLabel: UILabel!
    @IBOutlet weak var tiesLabel: UILabel!
    @IBOutlet weak var losesLabel: UILabel!

    // MARK: - Delegate functions
    func gotResult(userWin: Bool?) {
        if let userWin = userWin {
            if userWin {
                wins += 1
            } else {
                loses += 1
            }
        } else {
            ties += 1
        }
        updateResultUI()
    }
    
    // MARK: - UI related functions
    func updateResultUI() {
        totalTimesLabel.text = "# of plays: \(wins + ties + loses)"
        winsLabel.text = "You won: \(wins)"
        tiesLabel.text = "You tied: \(ties)"
        losesLabel.text = "You lost: \(loses)"
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    @IBAction func rockPicked(_ sender: Any) {
        let resultVC = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        resultVC.userChoice = RPS.rock
        resultVC.delegate = self
        present(resultVC, animated: true, completion: nil)
    }
    
    @IBAction func paperPicked(_ sender: Any) {
        performSegue(withIdentifier: "showResult", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResult" {
            let resultVC = segue.destination as! ResultViewController
            let buttonTitle = (sender as! UIButton).currentTitle!
            let userChoice = RPS(rawValue: buttonTitle)!
            resultVC.userChoice = userChoice
            resultVC.delegate = self
        }
    }

}
