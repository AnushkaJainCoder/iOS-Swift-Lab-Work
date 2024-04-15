import UIKit

class AthleteTableViewController: UITableViewController {
    
    struct PropertyKeys {
        static let athleteCell = "AthleteCell"
        static let addAthleteSegue = "AddAthlete"
        static let editAthleteSegue = "Editthlete"
//        static let newUnvind = "New"
    }
    
    override func viewDidLoad() {
        let dave = Athlete(name: "dave", age: "90", league: "swift", team: "cracking code")
        athletes.append(dave)
    }

    var athletes: [Athlete] = []
    
    
    
//    @IBSegueAction func AddAthleteSegue(_ coder: NSCoder) -> AthleteViewController? {
//        return <#AthleteViewController(coder: coder)#>
//    }
    @IBSegueAction func addathlete(_ coder: NSCoder) -> AthleteViewController? {
        return <#AthleteViewController(coder: coder)#>
    }
    
    
//    @IBSegueAction func editAthlete(_ coder: NSCoder) -> AthleteViewController? {
//        return <#AthleteViewController(coder: coder)#>
//    }
    
    @IBSegueAction func editathlete(_ coder: NSCoder, sender: Any?) -> AthleteViewController? {
        let athleteToEdit: Athlete?
        if let cell = sender as? UITableViewCell,
        let indexPath = tableView.indexPath(for: cell) {
        athleteToEdit = athletes[indexPath.row]
        } else {
        athleteToEdit = nil
        }
        return AthleteViewController(coder: coder, athlete: athleteToEdit)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return athletes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.athleteCell, for: indexPath)
        
        let athlete = athletes[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = athlete.name
        content.secondaryText = athlete.desc
        cell.contentConfiguration = content
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?){
        if let controller = segue.destination as?
            AthleteViewController,
            
            let index = tableView.indexPathForSelectedRow,segue.identifier == PropertyKeys.editAthleteSegue{
            controller.athlete = athletes[index.row]
            }
//            /controller.athlete = Athlete(name: "Dave", age: "43", league: "swift", team: "cracking code")
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

