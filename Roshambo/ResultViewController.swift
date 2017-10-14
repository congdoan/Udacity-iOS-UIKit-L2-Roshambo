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
    var resultImageName: String?
    var resultMassage: String?
    
    // MARK: - Outlets
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let resultImageName = resultImageName {
            resultImageView.image = UIImage(named: resultImageName)
        }
        if let resultMassage = resultMassage {
            resultLabel.text = resultMassage
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
    }
    
}
