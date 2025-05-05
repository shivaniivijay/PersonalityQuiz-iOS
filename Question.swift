//
//  Question.swift
//  PersonalityQuiz
//
//  Created by Shivani Vijay on 2025-02-27.
//

import Foundation

// Enum for question types
enum QuestionType {
    case single
    case multiple
    case ranged
    case segmented
}

// Struct for Answer
struct Answer {
    let text: String
    let type: AnimalType
}

// Enum for personality types
enum AnimalType: Character {
    case lion = "🦁", cat = "🐱", rabbit = "🐰", turtle = "🐢"

    var definition: String {
        switch self {
        case .lion:
            return "You are incredibly outgoing. You enjoy being around people."
        case .cat:
            return "You are independent and enjoy doing things on your own terms."
        case .rabbit:
            return "You are energetic and love soft things."
        case .turtle:
            return "You are wise and methodical, taking your time to make decisions."
        }
    }
}

// Struct for Question
struct Question {
    let text: String
    let type: QuestionType
    let answers: [Answer]
}
