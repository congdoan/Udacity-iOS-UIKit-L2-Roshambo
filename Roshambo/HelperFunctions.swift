//
//  ResultViewController+HelperFuncs.swift
//  Roshambo
//
//  Created by Cong Doan on 10/14/17.
//  Copyright © 2017 Cong Doan. All rights reserved.
//

import Foundation

// MARK - Helper Types
enum Choice: Int, CustomStringConvertible {
    case paper, rock, scissors
    
    var description: String {
        switch self {
        case .paper:
            return "Paper"
        case .rock:
            return "Rock"
        case .scissors:
            return "Scissors"
        }
    }
}

// MARK: - Helper Functions
func randomChoice() -> Choice {
    let randomRawValue = Int(arc4random_uniform(3))
    return Choice(rawValue: randomRawValue)!
}

func comparePlayChoices(userChoice: Choice, phoneChoice: Choice) -> (resultImageName: String, resultMassage: String, userWin: Bool?) {
    let resultImageName: String
    let resultMassage: String
    let userWin: Bool?
    let matchup = "\(userChoice) vs. \(phoneChoice)"
    switch (userChoice, phoneChoice) {
    case let (user, phone) where user == phone:
        resultImageName = "itsATie"
        resultMassage = "\(matchup): it's a tie!"
        userWin = nil
    case (.paper, .rock), (.rock, .scissors), (.scissors, .paper):
        resultImageName = "\(userChoice)-\(phoneChoice)"
        resultMassage = "You Win with \(matchup) 😀!"
        userWin = true
    default:
        resultImageName = "\(phoneChoice)-\(userChoice)"
        resultMassage = "You Lose with \(matchup) 😔!"
        userWin = false
    }
    return (resultImageName, resultMassage, userWin)
}
