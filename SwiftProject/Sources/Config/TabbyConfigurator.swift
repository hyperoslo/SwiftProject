import UIKit
import Hue
import Tabby

struct TabbyConfigurator: Configurable {

  func configure() {
    Tabby.Constant.Behavior.labelVisibility = .visible
  }
}
