import CornerRoundedImageView
import UIKit

class FirstViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  @IBOutlet private weak var collectionView: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.delegate = self
    collectionView.dataSource = self
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 200
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    guard let imageView = cell.contentView.viewWithTag(1) as? CornerRoundedImageViewImageView else { return cell }
    imageView.image = indexPath.row % 2 == 0 ? #imageLiteral(resourceName: "sample1") : #imageLiteral(resourceName: "sample2")
    return cell
  }
}
