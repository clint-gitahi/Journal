import UIKit
import RealmSwift

private let reuseIdentifier = "Cell"

class PhotoCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var pictures : Results<Picture>?

    override func viewWillAppear(_ animated: Bool) {
        getPictures()
    }
    
    func getPictures() {
        if let realm = try? Realm() {
            pictures = realm.objects(Picture.self)
            
            collectionView?.reloadData()
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let pictures = self.pictures {
            return pictures.count
        }
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? PhotoCell {
            
            if let picture = pictures? [indexPath.row] {
                cell.previewImageVeiw.image = picture.thumbnail()
                cell.dayLabel.text = picture.entry?.dayString()
                cell.monthYearLabel.text = picture.entry?.monthYearString()
            }
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/2, height: collectionView.frame.size.width/2)
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "photoToDetail", sender: pictures?[indexPath.row].entry)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "photoToDetail" {
            if let entry = sender as? Entry {
                if let detailVC = segue.destination as? JournalDetailViewController {
                    detailVC.entry = entry
                }
            }
        }
    }
}

class PhotoCell : UICollectionViewCell {
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var monthYearLabel: UILabel!
    @IBOutlet weak var previewImageVeiw: UIImageView!
}
