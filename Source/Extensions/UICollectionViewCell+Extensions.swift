import UIKit

extension UICollectionViewCell {
  static var reuseIdentifier: String {
    return String(describing: self)
  }
}
