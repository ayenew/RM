import UIKit

protocol DataDelegate {
    func dataDidPassed(data:Company)
}

class CompanyViewController: UITableViewController  {
    var companies = [Company]()
    var delegate : DataDelegate?
    let searchController = UISearchController(searchResultsController: nil)
    var filteredCompany = [Company]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1)
        loadCompanyInfo()
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = false
        tableView.tableHeaderView = searchController.searchBar
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredCompany.count
        }else{
           return companies.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "company", for: indexPath)
        if searchController.isActive && searchController.searchBar.text != "" {
            cell.textLabel?.text = filteredCompany[indexPath.row].name
            cell.detailTextLabel?.text = filteredCompany[indexPath.row].address
        } else {
            cell.textLabel?.text = companies[indexPath.row].name
            cell.detailTextLabel?.text = companies[indexPath.row].address
            cell.imageView?.image = UIImage(named: "business")
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //if delegate == nil {
        if segue.identifier == "2" {
            let destination = segue.destination as! UINavigationController
            let detailVC = destination.topViewController as! RedViewController
            //self.delegate = detailVC
            let selectedIndex = self.tableView.indexPathForSelectedRow!
            // delegate?.dataDidPassed(data: companies[selectedIndex.row])
            detailVC.company = companies[selectedIndex.row]
            //self.delegate = detailVC
           // let selectedIndex = self.tableView.indexPathForSelectedRow!
            // delegate?.dataDidPassed(data: companies[selectedIndex.row])
           // detailVC.company = companies[selectedIndex.row]
        }
        
       // }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //  let selectedCompany = self.companies[indexPath.row]
        //  if delegate != nil {
        //       delegate?.dataDidPassed(data: "true \(selectedCompany)")
        //   }
        //   if let detailViewController = self.delegate as? DetailViewController {
        //       splitViewController?.showDetailViewController(detailViewController, sender: nil)
        //   }
        switch indexPath.row {
        case 0:
            self.performSegue(withIdentifier: "2", sender: nil)
        case 1:
            self.performSegue(withIdentifier: "2", sender: nil)
        case 2:
            self.performSegue(withIdentifier: "3", sender: nil)
        default:
            break
        }
    }
    
    func loadCompanyInfo(){
        if let path = Bundle.main.path(forResource: "Company", ofType: "json") {
            do {
                let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                do {
                    let jsonResult: [String:Any] = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String:Any]
                    
                    if let companyArray : [[String:Any]] = jsonResult["company"] as? [[String:Any]] {
                        for aCompany in companyArray {
                            companies.append(Company(name: aCompany["name"] as! String, address: aCompany["address"] as! String, city: aCompany["city"] as! String))
                        }
                    }
                } catch {}
            } catch {}
        }
    }
    
    }

extension CompanyViewController:UISearchBarDelegate,UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        self.filteredCompany = self.companies.filter({
            nil != $0.name.range(of:searchController.searchBar.text!)
        })
        tableView.reloadData()
    }

}
