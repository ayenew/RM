import UIKit

class CustomSplitViewController: UISplitViewController {
    override func viewDidLoad(){
      super.viewDidLoad()
        self.splitViewController?.presentsWithGesture = true
        //preferredDisplayMode = .allVisible
        splitViewController?.view.backgroundColor = UIColor.red
        self.tabBarController?.tabBar.isTranslucent = false
        self.tabBarController?.tabBar.barTintColor = UIColor.red
        self.tabBarController?.tabBar.backgroundColor = UIColor.blue
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //
    }
}
