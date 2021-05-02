import UIKit

class HomeVC: UIViewController
{
    @IBOutlet weak var segmentCtrl: UISegmentedControl!
    @IBOutlet weak var topCollV: UICollectionView!
    @IBOutlet weak var pageCtrl: UIPageControl!
    @IBOutlet weak var homeTabV: UITableView!
    
    //Top Main Slider (CollectionView)
    let TopSliderImgArr = ["God of Thunder Slider","Black Panther Slider","KGF Chapter 2 Slider","World War Z Slider","Four More Shots Please Slider","Sacred Games Slider","The Family Man Slider","Dont Breathe Slider"]
    
    //Bottom Home Tab Slider (TableView)
    let HomeTitleArr = ["Top Movies","TV shows we think you'll like","Movies in Hindi","Action and adventure movies","Amazon Original series","Amazon Original movies","Horror movies"]
    
    let HomeImgArr = [["Iron Man 2","Ant Man and Wasp","Avengers Endgame","3 Idiots"],["Arrow","Four More Shots Please","Mirzapur","Power","The Family Man","Misfits"],["KGF Chapter 1","3 Idiots","Coolie No 1","KGF Chapter 2"],["Captain America Civil War","Iron Man 3","Spider Man Homecoming","Thor the dark world","Black Panther","Captain America The Winter Soldier"],["The Forgotten Army","The Family Man","Mirzapur","Sacred Games","The Terror"],["Coming 2 America","Coolie No 1","Harry Potter"],["Dont Breathe","The Conjuring","World War Z","IT Chapter 2"]]
    
    //Bottom TV Shows Tab Slider (TableView)
    let TvTitleArr = ["TV shows we think you'll like","Filmfare OTT Award Winners","Amazon Original series"]
    
    let TvImgArr = [["Arrow","Four More Shots Please","Mirzapur","Power","The Family Man","Misfits"],["The Forgotten Army","The Family Man","Mirzapur","Sacred Games"],["Coming 2 America","Coolie No 1","Harry Potter","The Terror"]]
    
    //Bottom Movies Tab Slider (TableView)
    let MovieTitleArr = ["Top Movies","Movies in Hindi","Action and adventure movies","Thriller movies"]
    
    let MovieImgArr = [["Iron Man 2","Ant Man and Wasp","Avengers Endgame","3 Idiots"],["KGF Chapter 1","3 Idiots","Coolie No 1","KGF Chapter 2"],["Captain America Civil War","Iron Man 3","Spider Man Homecoming","Thor the dark world","Black Panther","Captain America The Winter Soldier"],["Dont Breathe","The Conjuring","World War Z","IT Chapter 2"]]
    
    //Bottom Kids Tab Slider (TableView)
    let KidsTitleArr = ["Kids and family movies","Kids and family TV","Top movies for kids and family","Amazon Original Kids series","Comedy TV"]
    
    let KidsImgArr = [["Harry Potter","Angry Birds Movie","Tom & Jerry Movie","How to train your dragon","Stuart Little"],["Kung Fu Panda","Roll no 21","Ben 10"],["KGF Chapter 2","3 Idiots","Iron Man 3","Ant Man and Wasp"],["Spider Man Homecoming","Harry Potter"],["Dexter Lab","Angry Birds Movie","Tom & Jerry Movie","Stuart Little","3 Idiots","Coming 2 America"]]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //Segment Control Text Color Change
        if ((segmentCtrl?.selectedSegmentIndex) != nil)
        {
            segmentCtrl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.normal)
        }
        segmentCtrl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: UIControl.State.selected)
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl)
    {
        print("Selected Segment \(sender.selectedSegmentIndex)")
        homeTabV.reloadData()
        topCollV.reloadData()
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        if segmentCtrl.selectedSegmentIndex == 0
        {
            return HomeTitleArr.count
        }
        else if segmentCtrl.selectedSegmentIndex == 1
        {
            return TvTitleArr.count
        }
        else if segmentCtrl.selectedSegmentIndex == 2
        {
            return MovieTitleArr.count
        }
        return KidsTitleArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BottomCellTVC") as! BottomCellTVC
        cell.bottomCollV.tag = indexPath.section
        cell.bottomCollV.delegate = self
        cell.bottomCollV.dataSource = self
        cell.selectionStyle = .none
        cell.bottomCollV.reloadData()
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        if segmentCtrl.selectedSegmentIndex == 0
        {
            return HomeTitleArr[section]
        }
        else if segmentCtrl.selectedSegmentIndex == 1
        {
            return TvTitleArr[section]
        }
        else if segmentCtrl.selectedSegmentIndex == 2
        {
            return MovieTitleArr[section]
        }
        return KidsTitleArr[section]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 145
    }
    
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if collectionView == topCollV
        {
            return TopSliderImgArr.count
        }
        if segmentCtrl.selectedSegmentIndex == 0
        {
            return HomeImgArr[collectionView.tag].count
        }
        else if segmentCtrl.selectedSegmentIndex == 1
        {
            return TvImgArr[collectionView.tag].count
        }
        else if segmentCtrl.selectedSegmentIndex == 2
        {
            return MovieImgArr[collectionView.tag].count
        }
        return KidsImgArr[collectionView.tag].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        if collectionView == topCollV
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopSliderCVC", for: indexPath) as! TopSliderCVC
            cell.topImgV.contentMode = .scaleAspectFill
            cell.topImgV.image = UIImage(named: TopSliderImgArr[indexPath.row])
            return cell
        }
        if segmentCtrl.selectedSegmentIndex == 0
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BottomSliderCVC", for: indexPath) as! BottomSliderCVC
            cell.bottomImgV.contentMode = .scaleAspectFill
            cell.bottomImgV.layer.cornerRadius = 10.0
            cell.bottomImgV.image = UIImage(named: HomeImgArr[collectionView.tag][indexPath.row])
            return cell
        }
        else if segmentCtrl.selectedSegmentIndex == 1
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BottomSliderCVC", for: indexPath) as! BottomSliderCVC
            cell.bottomImgV.contentMode = .scaleAspectFill
            cell.bottomImgV.layer.cornerRadius = 10.0
            cell.bottomImgV.image = UIImage(named: TvImgArr[collectionView.tag][indexPath.row])
            return cell
        }
        else if segmentCtrl.selectedSegmentIndex == 2
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BottomSliderCVC", for: indexPath) as! BottomSliderCVC
            cell.bottomImgV.contentMode = .scaleAspectFill
            cell.bottomImgV.layer.cornerRadius = 10.0
            cell.bottomImgV.image = UIImage(named: MovieImgArr[collectionView.tag][indexPath.row])
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BottomSliderCVC", for: indexPath) as! BottomSliderCVC
        cell.bottomImgV.contentMode = .scaleAspectFill
        cell.bottomImgV.layer.cornerRadius = 10.0
        cell.bottomImgV.image = UIImage(named: KidsImgArr[collectionView.tag][indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if collectionView == topCollV
        {
            return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
        }
        return CGSize(width: 200, height: 125)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView)
    {
        print("Scroll Finish \(scrollView.contentOffset.x) CV W -> \(topCollV.frame.size.width)")
        pageCtrl.currentPage = Int(scrollView.contentOffset.x/topCollV.frame.size.width)
    }
}

class TopSliderCVC: UICollectionViewCell
{
    @IBOutlet weak var topImgV: UIImageView!
}

class BottomCellTVC: UITableViewCell
{
    @IBOutlet weak var bottomCollV: UICollectionView!
}

class BottomSliderCVC: UICollectionViewCell
{
    @IBOutlet weak var bottomImgV: UIImageView!
}
