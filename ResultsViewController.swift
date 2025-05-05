//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Shivani Vijay on 2025-02-27.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var responses: [Answer] = []
    static var pastResults: [(type: AnimalType, definition: String)] = []
    
    
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!
    
    @IBOutlet weak var historyTextView: UITextView!
    
    required init?(coder: NSCoder) {
           super.init(coder: coder)
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        var historyText = ""
        for result in ResultsViewController.pastResults {
            historyText += "\(result.type.rawValue): \(result.definition)\n\n"
        }
        
        historyTextView.text = historyText  
        
        updateUI(with: ResultsViewController.pastResults.last?.type)
    }

    
    func setResponses(_ responses: [Answer]) {
            self.responses = responses
        calculatePersonalityResult()
        }
    
    func calculatePersonalityResult() {
        let frequencyOfAnswers = responses.reduce(into: [AnimalType: Int]()) { counts, answer in
            counts[answer.type, default: 0] += 1
        }

        if let mostCommonAnswer = frequencyOfAnswers.sorted(by: { $0.value > $1.value }).first?.key {
            ResultsViewController.pastResults.append((type: mostCommonAnswer, definition: mostCommonAnswer.definition))

            updateUI(with: mostCommonAnswer)
        }
    }

    
    func updateUI(with result: AnimalType?) {
           guard let result = result else { return }
           
           resultAnswerLabel.text = "You are a \(result.rawValue)!"
           resultDefinitionLabel.text = result.definition
       }
    }
