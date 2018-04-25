import UIKit

extension UIView {
  func addSubviews(_ views: UIView...) {
    for view in views {
      addSubview(view)
    }
  }

  func addParallaxMotionEffects(tiltValue: CGFloat = 0.25, panValue: CGFloat = 5, to view: UIView?) {
    let motionGroup = UIMotionEffectGroup()
    let xTilt = UIInterpolatingMotionEffect(keyPath: "layer.transform.rotation.y", type: .tiltAlongHorizontalAxis)
    xTilt.minimumRelativeValue = -tiltValue
    xTilt.maximumRelativeValue = tiltValue
    let yTilt = UIInterpolatingMotionEffect(keyPath: "layer.transform.rotation.x", type: .tiltAlongVerticalAxis)
    yTilt.minimumRelativeValue = tiltValue
    yTilt.maximumRelativeValue = -tiltValue
    let xPan = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
    xPan.minimumRelativeValue = -panValue
    xPan.maximumRelativeValue = panValue
    let yPan = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
    yPan.minimumRelativeValue = -panValue
    yPan.maximumRelativeValue = panValue
    motionGroup.motionEffects = [xTilt, yTilt, xPan, yPan]
    view?.addMotionEffect(motionGroup)
  }
}
