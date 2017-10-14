//
//  ResultViewController+HelperFuncs.swift
//  Roshambo
//
//  Created by Cong Doan on 10/14/17.
//  Copyright © 2017 Cong Doan. All rights reserved.
//

import Foundation

// MARK: - Helper Functions
func comparePlayChoices(userChoice: RPS, phoneChoice: RPS) -> (resultImageName: String, resultMassage: String, userWin: Bool?) {
    let resultImageName: String
    let resultMassage: String
    let userWin: Bool?
    let matchup = "\(userChoice.rawValue) vs. \(phoneChoice.rawValue)"
    switch (userChoice, phoneChoice) {
    case let (user, phone) where user == phone:
        resultImageName = "itsATie"
        resultMassage = "\(matchup): it's a tie!"
        userWin = nil
    case (.paper, .rock), (.rock, .scissors), (.scissors, .paper):
        resultImageName = "\(userChoice.rawValue)-\(phoneChoice.rawValue)"
        resultMassage = "You Win with \(matchup) 😀!"
        userWin = true
    default:
        resultImageName = "\(phoneChoice.rawValue)-\(userChoice.rawValue)"
        resultMassage = "You Lose with \(matchup) 😔!"
        userWin = false
    }
    return (resultImageName, resultMassage, userWin)
}
