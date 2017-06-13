import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isTranslucent = false
        self.tabBarController?.tabBar.barTintColor = UIColor.red
        self.tabBarController?.tabBar.backgroundColor = UIColor.blue
    }

}
