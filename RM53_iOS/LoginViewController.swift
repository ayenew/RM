import UIKit

class LoginViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        Utility.lockOrientation(.all)
    }

    override func viewWillDisappear(_ animated: Bool) {
        Utility.lockOrientation(.all)
    }

    @IBAction func login(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "splitVc") as! UISplitViewController
        present(vc, animated: true, completion: nil)
    }
}
