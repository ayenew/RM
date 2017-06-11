import UIKit

class CustomSplitViewController: UISplitViewController {
    override func viewDidLoad(){
      super.viewDidLoad()
        self.splitViewController?.presentsWithGesture = true
        //preferredDisplayMode = .allVisible
        splitViewController?.view.backgroundColor = UIColor.red
    }
}
