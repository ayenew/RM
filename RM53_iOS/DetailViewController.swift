import UIKit

class DetailViewController: UICollectionViewController, DataDelegate, UISplitViewControllerDelegate, UICollectionViewDelegateFlowLayout {
    let backgroundColors = [UIColor(red: 246/255.0, green: 246/255.0, blue: 246/255.0, alpha: 1),UIColor(red: 250/255.0, green: 250/255.0, blue: 250/255.0, alpha: 1)]
    var pageTitle:String = ""
    var indexNumber: Int = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1)
        self.navigationItem.leftItemsSupplementBackButton = true
        self.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        
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
        return 9
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 4
    }

    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "card", for: indexPath)
        let view = UIView(frame: cell.bounds)
        view.backgroundColor = UIColor(colorLiteralRed: 0.278, green: 0.694, blue: 0.537, alpha: 1.00)
        view.layer.cornerRadius = 10
        cell.selectedBackgroundView = view
        let indx = indexPath.row % 2 == 0 ? 0 : 1
        cell.backgroundColor = backgroundColors[indx]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: 150, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize{
        return CGSize(width: self.collectionView!.frame.size.width - 100, height: 30)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView{
        
        switch kind {
            
        case UICollectionElementKindSectionHeader:
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind,withReuseIdentifier: "header",for: indexPath)
            view.backgroundColor = UIColor.white
                //UIColor(red: 238/255.0, green: 238/255.0, blue: 238/255.0, alpha: 1)
            print(indexPath.section)
            
            let label = UILabel(frame: view.frame)
            label.text = "YTD Revenue \(indexPath.section) - \(indexPath.row)"
            label.font = UIFont(name: "helvetica", size: 20)
            label.textAlignment = .center
            view.addSubview(label)
            return view
            
        default:
            
            assert(false, "Unexpected element kind")
        }

    }
    
    
    func dataDidPassed(data:Company) {
        // print("Data Passed \(data[0])")
    }
    
    
}
