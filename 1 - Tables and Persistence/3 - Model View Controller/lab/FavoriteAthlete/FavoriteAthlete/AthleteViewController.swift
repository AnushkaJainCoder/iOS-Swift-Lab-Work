//
//  AthleteViewController.swift
//  FavoriteAthlete
//
//  Created by student on 05/04/24.
//

import UIKit

class AthleteViewController: UIViewController {
    struct PropertyKeys {
        
        static let newUnvind = "New"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()

        // Do any additional setup after loading the view.
    }
    var athlete: Athlete?
//    init?(coder: NSCoder, athlete: Athlete?){
    @IBOutlet weak var nameText: UITextField!
    //        self.athlete = athlete
    @IBOutlet weak var ageText: UITextField!
    //    }
    @IBOutlet weak var LeagueText: UITextField!
    
    @IBOutlet weak var teamText: UITextField!
  
    
   
    
    
    
    func updateView(){
        
        if let confirmedAthlete = athlete{
            print("confirmed  \(confirmedAthlete)!")
            nameText.text = confirmedAthlete.name
            teamText.text = confirmedAthlete.team
            LeagueText.text = confirmedAthlete.league
            ageText.text = confirmedAthlete.age
            
        }
        
    }
    @IBAction func persist(_ sender: Any) {
        
        guard let name = nameText.text,
              let age = ageText.text,
              let team = teamText.text,
                let league = LeagueText.text
        else{
            
            return
        }
        athlete = Athlete(name: name, age: age, league: league, team: team)
        
        performSegue(withIdentifier: PropertyKeys.newUnvind, sender: self)
              
//        nameText = con
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
