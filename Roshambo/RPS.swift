//
//  RPS.swift
//  Roshambo
//
//  Created by Cong Doan on 10/14/17.
//  Copyright © 2017 Cong Doan. All rights reserved.
//

import Foundation

// MARK: Model type
enum RPS: String {
    case paper = "Paper", rock = "Rock", scissors = "Scissors"
    
    static let allChoices = [paper, rock, scissors]
    static func randomChoice() -> RPS {
        let randomIndex = Int(arc4random_uniform(3))
        return RPS.allChoices[randomIndex]
    }
}

