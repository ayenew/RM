import UIKit

class DetailViewController: TopViewController, DataDelegate, UISplitViewControllerDelegate {

  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.navigationBar.barTintColor = UIColor(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1)
  }
    
  func dataDidPassed(data:Company) {
       // print("Data Passed \(data[0])")
    }
    
    
}
