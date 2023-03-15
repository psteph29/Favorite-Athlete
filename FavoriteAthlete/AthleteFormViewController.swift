//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Paige Stephenson on 3/13/23.
//

import UIKit

class AthleteFormViewController: UIViewController {
    
    var athlete: Athlete?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var leagueTextField: UITextField!
    @IBOutlet weak var teamTextField: UITextField!
    
    
   
//    Optional because it will be nil when the user comes to the screen to create a new athlete, and it will have a value when the user comes to the screen to edit an athlete
    
    init?(coder: NSCoder, athlete: Athlete?) {
        super.init(coder: coder)
        self.athlete = athlete
       
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
       
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()

        // Do any additional setup after loading the view.
    }
    
    func updateView() {
        if let athlete = athlete {
            nameTextField.text = athlete.name
            ageTextField.text = String(athlete.age)
            leagueTextField.text = athlete.league
            teamTextField.text = athlete.team
             
        }
//        here we are checking if the athlete is nil or not. If it is, it will be unwrapped.
    }
    
    
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        guard let name = nameTextField.text,
              let ageString = ageTextField.text,
              let age = Int(ageString),
              let league = leagueTextField.text,
              let team = teamTextField.text
        else { return }
       
        athlete = Athlete(name: name, age: age, league: league, team: team)

        performSegue(withIdentifier: "unwindToAthlete", sender: self)
    }
    

    
}
