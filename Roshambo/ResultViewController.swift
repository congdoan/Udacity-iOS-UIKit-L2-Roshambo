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
    var userWin: Bool?
    var delegate: ResultViewControllerDelegate?
    
    // MARK: - Outlets
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let userChoice = userChoice {
            let result = comparePlayChoices(userChoice: userChoice, phoneChoice: RPS.randomChoice())
            resultImageView.image = UIImage(named: result.resultImageName)
            resultLabel.text = result.resultMassage
            userWin = result.userWin
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
            delegate.gotResult(userWin: userWin)
        }
    }
    
}
