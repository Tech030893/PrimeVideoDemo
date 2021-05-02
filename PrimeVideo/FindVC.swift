import UIKit

class FindVC: UIViewController
{
    @IBOutlet weak var findTabV: UITableView!
    
    let sectionArr = ["Genres","Languages"]
    let GenLangArr = [["Drama","Action and Adventure","Romance","Comedy","Thriller","Horror"],["English","Hindi","Marathi","Gujarati","Telugu","Tamil","Kannada","Malayalam","Punjab","Bengali"]]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
}

extension FindVC: UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return sectionArr.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return sectionArr[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return GenLangArr[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FindTVC") as! FindTVC
        cell.findLbl.text = GenLangArr[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 60
    }
}

class FindTVC: UITableViewCell
{
    @IBOutlet weak var findLbl: UILabel!
}
