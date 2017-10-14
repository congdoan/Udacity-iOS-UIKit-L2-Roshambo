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
    let randomRawValue = Int(arc4random() % 3)
    return Choice(rawValue: randomRawValue)!
}

func computeResult(userChoice: Choice, phoneChoice: Choice) -> (resultImageName: String, resultMassage: String) {
    let resultImageName: String
    let resultMassage: String
    if userChoice == phoneChoice {
        resultImageName = "itsATie"
        resultMassage = "\(userChoice) ties \(phoneChoice).You Tie!"
    } else {
        if userChoice == .paper && phoneChoice == .rock {
            resultImageName = "PaperCoversRock"
            resultMassage = "Paper covers Rock. You Win!"
        } else if userChoice == .rock && phoneChoice == .paper {
            resultImageName = "PaperCoversRock"
            resultMassage = "Paper covers Rock. You Lose!"
        } else if userChoice == .rock && phoneChoice == .scissors {
            resultImageName = "RockCrushesScissors"
            resultMassage = "Rock crushes Scissors. You Win!"
        } else if userChoice == .scissors && phoneChoice == .rock {
            resultImageName = "RockCrushesScissors"
            resultMassage = "Rock crushes Scissors. You Lose!"
        } else if userChoice == .scissors && phoneChoice == .paper {
            resultImageName = "ScissorsCutPaper"
            resultMassage = "Scissors cut Paper. You Win!"
        } else {
            assert(userChoice == .paper && phoneChoice == .scissors)
            resultImageName = "ScissorsCutPaper"
            resultMassage = "Scissors cut Paper. You Lose!"
        }
    }
    return (resultImageName, resultMassage)
}
