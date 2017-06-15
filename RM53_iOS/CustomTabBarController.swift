import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isTranslucent = false
        self.tabBarController?.tabBar.barTintColor = UIColor.red
        self.tabBarController?.tabBar.backgroundColor = UIColor.blue
        loadCompanyInfo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }

}
