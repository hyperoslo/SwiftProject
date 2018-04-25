import UIKit

extension NSLayoutConstraint {
  static func constrain(_ constraints: NSLayoutConstraint?...) {
    for constraint in constraints {
      (constraint?.firstItem as? UIView)?.translatesAutoresizingMaskIntoConstraints = false
    }

    NSLayoutConstraint.activate(constraints.compactMap { $0 })
  }

  static func pin(_ view: UIView, toView: UIView, insets: UIEdgeInsets = .zero) {
    NSLayoutConstraint.constrain(
      view.leadingAnchor.constraint(equalTo: toView.leadingAnchor, constant: insets.left),
      view.trailingAnchor.constraint(equalTo: toView.trailingAnchor, constant: -insets.right),
      view.topAnchor.constraint(equalTo: toView.topAnchor, constant: insets.top),
      view.bottomAnchor.constraint(equalTo: toView.bottomAnchor, constant: -insets.bottom)
    )
  }

  static func pin(_ layoutGuide: UILayoutGuide, toView: UIView, insets: UIEdgeInsets = .zero) {
    NSLayoutConstraint.constrain(
      layoutGuide.leadingAnchor.constraint(equalTo: toView.leadingAnchor, constant: insets.left),
      layoutGuide.trailingAnchor.constraint(equalTo: toView.trailingAnchor, constant: -insets.right),
      layoutGuide.topAnchor.constraint(equalTo: toView.topAnchor, constant: insets.top),
      layoutGuide.bottomAnchor.constraint(equalTo: toView.bottomAnchor, constant: -insets.bottom)
    )
  }
}
