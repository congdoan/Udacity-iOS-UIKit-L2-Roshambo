//
//  ResultViewController.swift
//  Roshambo
//
//  Created by Cong Doan on 10/13/17.
//  Copyright © 2017 Cong Doan. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    // Variables
    var userChoice: RPS?
    var matchResult: RPSMatch!
    var delegate: ResultViewControllerDelegate?
    
    // MARK: - Outlets
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let userChoice = userChoice {
            let phoneChoice = RPS.randomChoice()
            let result = comparePlayChoices(userChoice: userChoice, phoneChoice: phoneChoice)
            resultImageView.image = UIImage(named: result.resultImageName)
            resultLabel.text = result.resultMassage
            matchResult = RPSMatch(userChoice: userChoice, phoneChoice: phoneChoice, userWin: result.userWin)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.3) {
            self.resultImageView.alpha = 1
        }
    }

    // MARK: - Actions
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        if let delegate = delegate {
            delegate.gotResult(matchResult: matchResult)
        }
    }
    
}
