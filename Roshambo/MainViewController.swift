//
//  MainViewController.swift
//  Roshambo
//
//  Created by Cong Doan on 10/13/17.
//  Copyright © 2017 Cong Doan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    @IBAction func rockPicked(_ sender: Any) {
        let resultVC = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        let result = computeResult(userChoice: Choice.rock, phoneChoice: randomChoice())
        resultVC.resultImageName = result.resultImageName
        resultVC.resultMassage = result.resultMassage
        present(resultVC, animated: true, completion: nil)
    }
    
    @IBAction func paperPicked(_ sender: Any) {
        performSegue(withIdentifier: "showResult", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResult" {
            let resultVC = segue.destination as! ResultViewController
            let viewTag = (sender as! UIView).tag
            let userChoice = Choice(rawValue: viewTag)!
            let result = computeResult(userChoice: userChoice, phoneChoice: randomChoice())
            resultVC.resultImageName = result.resultImageName
            resultVC.resultMassage = result.resultMassage
        }
    }

}
