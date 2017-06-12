import UIKit

class RedViewController: TopViewController, DataDelegate {
    @IBOutlet weak var companyName: UILabel!
    var company:Company?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         self.companyName.text = self.company?.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func dataDidPassed(data:Company) {
        print(data.name)
        self.company = data
    }
}
