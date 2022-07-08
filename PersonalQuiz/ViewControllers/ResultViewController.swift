//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 07.07.2022.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet var resultTitleLabel: UILabel!
    @IBOutlet var resultDescriptionLabel: UILabel!
    
    var answersChosen: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        getResult()
        
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    private func getResult() {
        var resultOfAnimalType = [Animal: Int]()
        let animalsType = answersChosen.map { $0.animal }
        
        for animal in animalsType {
            if let animalCount = resultOfAnimalType[animal] {
                resultOfAnimalType.updateValue(animalCount + 1, forKey: animal)
            } else {
                resultOfAnimalType[animal] = 1
            }
        }
        let sortedOfAllResults = resultOfAnimalType.sorted { $0.value > $1.value }
        guard let resultAnswer = sortedOfAllResults.first?.key else { return }
        
        resultTitleLabel.text = "ВЫ - \(resultAnswer.rawValue)!"
        resultDescriptionLabel.text = resultAnswer.definition
    }
    
    
}
