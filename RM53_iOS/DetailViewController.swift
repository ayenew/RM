import UIKit

class DetailViewController: UICollectionViewController, DataDelegate, UISplitViewControllerDelegate, UICollectionViewDelegateFlowLayout {
    var company  = [String:Any]()
   // var companies = [[String:Any]]()
    fileprivate let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    let backgroundColors = [UIColor(red: 246/255.0, green: 246/255.0, blue: 246/255.0, alpha: 1),UIColor(red: 250/255.0, green: 250/255.0, blue: 250/255.0, alpha: 1)]
    var pageTitle:String = ""
    var indexNumber: Int = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.blue]
        self.navigationItem.leftItemsSupplementBackButton = true
        self.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        collectionView?.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "card")
        collectionView?.register(UINib(nibName: "CustomCollectionViewCell2", bundle: nil), forCellWithReuseIdentifier: "card2")
        //loadCompanyInfo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if self.indexNumber < 0 {
           self.pageTitle = "All Companies Book"
        } else{
            self.pageTitle = "\(pageTitle)'s Book"
        }
        self.navigationItem.title = self.pageTitle
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 11
    }

    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell : MasterCollectionViewCell? = nil
        var indexRowData = [String:Any]()
        company = relationshipRepo[0]
        switch indexPath.row {
        case 0:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "card", for: indexPath) as! CustomCollectionViewCell
                indexRowData = company["notifications"] as! [String : Any]
        case 1:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "card2", for: indexPath) as! CustomCollectionViewCell2
            indexRowData = company["alerts"] as! [String : Any]
        default :
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "card", for: indexPath) as! CustomCollectionViewCell
            
        }
       // let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "card", for: indexPath) as! CustomCollectionViewCell
        cell?.contentView.layer.cornerRadius = 10.0
        cell?.contentView.layer.borderWidth = 1.0
        cell?.contentView.layer.borderColor = UIColor.clear.cgColor
        cell?.contentView.layer.masksToBounds = false
        
        cell?.layer.shadowColor = UIColor.lightGray.cgColor
        cell?.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell?.layer.shadowRadius = 2.0
        cell?.layer.shadowOpacity = 1.0
        cell?.layer.masksToBounds = false
        cell?.layer.shadowPath = UIBezierPath(roundedRect: (cell?.bounds)!, cornerRadius: (cell?.contentView.layer.cornerRadius)!).cgPath
        
        
        let view = UIView(frame: (cell?.bounds)!)
        view.backgroundColor = UIColor(red: 230/255.0, green: 229/255.0, blue: 230/255.0, alpha: 1)
        view.layer.cornerRadius = 10.0
        cell?.selectedBackgroundView = view
        let indx = indexPath.row % 2 == 0 ? 0 : 1
        cell?.backgroundColor = backgroundColors[indx]
        cell?.title.setTitle(indexRowData["title"] as! String?, for: .normal)
        cell?.amount.text = indexRowData["subTitle"] as! String?
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let paddingSpace = sectionInsets.left * (1 + 3)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / 3
        print(widthPerItem)
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        guard let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        flowLayout.invalidateLayout()
    }
    
    func dataDidPassed(data:Company) {
        // print("Data Passed \(data[0])")
    }
    
//    func loadCompanyInfo(){
//        if let path = Bundle.main.path(forResource: "Company", ofType: "json") {
//            do {
//                let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
//                do {
//                    let jsonResult: [String:[[String:Any]]] = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String:[[String:Any]]]
//                    
//                    let companiesArray : [[String:Any]] = jsonResult["relationship"]! as [[String:Any]]
//                    for aCompany in companiesArray {
//                        var c = [String:Any]()
//                        c["name"] = aCompany["name"] as! String
//                        c["address"] = aCompany["address"] as! String
//                        c["zip"] = aCompany["zip"] as! String
//                        c["notifications"] = aCompany["notifications"] as! [String:Any]
//                        c["alerts"] = aCompany["alerts"] as! [String:Any]
//                        companies.append(c)
//                    }
//                } catch {}
//            } catch {}
//        }
//    }
    
    
}
