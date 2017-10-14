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

func comparePlayChoices(userChoice: Choice, phoneChoice: Choice) -> (resultImageName: String, resultMassage: String, userWin: Bool?) {
    if arc4random() % 2 == 0 {
        return compareWithIfElse(userChoice: userChoice, phoneChoice: phoneChoice)
    }
    return compareWithSwitch(userChoice: userChoice, phoneChoice: phoneChoice)
}

func compareWithIfElse(userChoice: Choice, phoneChoice: Choice) -> (resultImageName: String, resultMassage: String, userWin: Bool?) {
    let resultImageName: String
    let resultMassage: String
    let userWin: Bool?
    if userChoice == phoneChoice {
        resultImageName = "itsATie"
        resultMassage = "\(userChoice) ties \(phoneChoice). You Tie!"
        userWin = nil
    } else {
        if userChoice == .paper && phoneChoice == .rock {
            resultImageName = "PaperCoversRock"
            resultMassage = "Paper covers Rock. You Win!"
            userWin = true
        } else if userChoice == .rock && phoneChoice == .paper {
            resultImageName = "PaperCoversRock"
            resultMassage = "Paper covers Rock. You Lose!"
            userWin = false
        } else if userChoice == .rock && phoneChoice == .scissors {
            resultImageName = "RockCrushesScissors"
            resultMassage = "Rock crushes Scissors. You Win!"
            userWin = true
        } else if userChoice == .scissors && phoneChoice == .rock {
            resultImageName = "RockCrushesScissors"
            resultMassage = "Rock crushes Scissors. You Lose!"
            userWin = false
        } else if userChoice == .scissors && phoneChoice == .paper {
            resultImageName = "ScissorsCutPaper"
            resultMassage = "Scissors cut Paper. You Win!"
            userWin = true
        } else {
            assert(userChoice == .paper && phoneChoice == .scissors)
            resultImageName = "ScissorsCutPaper"
            resultMassage = "Scissors cut Paper. You Lose!"
            userWin = false
        }
    }
    return (resultImageName, resultMassage, userWin)
}

func compareWithSwitch(userChoice: Choice, phoneChoice: Choice) -> (resultImageName: String, resultMassage: String, userWin: Bool?) {
    let resultImageName: String
    let resultMassage: String
    let userWin: Bool?
    switch userChoice {
    case .paper:
        switch phoneChoice {
        case .paper:
            resultImageName = "itsATie"
            resultMassage = "Paper ties Paper. You Tie!"
            userWin = nil
        case .rock:
            resultImageName = "PaperCoversRock"
            resultMassage = "Paper covers Rock. You Win!"
            userWin = true
        case .scissors:
            resultImageName = "ScissorsCutPaper"
            resultMassage = "Scissors cut Paper. You Lose!"
            userWin = false
        }
    case .rock:
        switch phoneChoice {
        case .paper:
            resultImageName = "PaperCoversRock"
            resultMassage = "Paper covers Rock. You Lose!"
            userWin = false
        case .rock:
            resultImageName = "itsATie"
            resultMassage = "Rock ties Rock. You Tie!"
            userWin = nil
        case .scissors:
            resultImageName = "RockCrushesScissors"
            resultMassage = "Rock crushes Scissors. You Win!"
            userWin = true
        }
    case .scissors:
        switch phoneChoice {
        case .paper:
            resultImageName = "ScissorsCutPaper"
            resultMassage = "Scissors cut Paper. You Win!"
            userWin = true
        case .rock:
            resultImageName = "RockCrushesScissors"
            resultMassage = "Rock crushes Scissors. You Lose!"
            userWin = false
        case .scissors:
            resultImageName = "itsATie"
            resultMassage = "Scissors ties Scissors. You Tie!"
            userWin = nil
        }
    }
    return (resultImageName, resultMassage, userWin)
}

