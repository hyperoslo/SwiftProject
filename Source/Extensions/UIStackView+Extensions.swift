import UIKit

extension UIStackView {
  convenience init(_ direction: UILayoutConstraintAxis = .horizontal,
                   alignment: UIStackViewAlignment = .fill,
                   spacing: CGFloat,
                   views: [UIView]) {
    self.init(arrangedSubviews: views)
    self.axis = direction
    self.alignment = alignment
    self.spacing = spacing
  }

  convenience init(_ direction: UILayoutConstraintAxis = .horizontal,
                   alignment: UIStackViewAlignment = .fill,
                   spacing: CGFloat,
                   views: UIView ...) {
    self.init(direction, alignment: alignment, spacing: spacing, views: views)
  }
}
